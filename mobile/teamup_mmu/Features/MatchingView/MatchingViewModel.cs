using System.Collections.ObjectModel;
using System.Net.Http.Json;
using System.Net.Http.Headers;
using System.Text.Json.Serialization;

namespace teamup_mmu.Features.MatchingView;

public class MatchingViewModel : BindableObject
{
    private readonly AuthService _authService;
    // CRITICAL: Use the HttpClient from AuthService so cookies/base address are shared
    private readonly HttpClient _httpClient;
    
    public ObservableCollection<UserProfile> Users { get; set; } = new();

    public Command LoadDataCommand { get; }

    public MatchingViewModel(AuthService authService)
    {
        _authService = authService;
        // Assuming AuthService has a public property or method to get its HttpClient
        // If not, you can keep your new HttpClient but we must fix the headers
        _httpClient = new HttpClient(); 
        LoadDataCommand = new Command(async () => await LoadDataAsync());
    }

    private int _currentIter = 0;
    async Task LoadDataAsync()
    {
        try
        {
            var token = _authService.GetAccessTokenValue();
            // var url_string = $"http://192.168.100.155:8000/matching/{_currentIter}/?format=json";
            var url_string = $"http://teamupmmu.com/matching/{_currentIter}/?format=json";

            var request = new HttpRequestMessage(HttpMethod.Get, url_string);
            request.Headers.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            request.Headers.Add("X-Mobile-App", "true"); // Match your Django view check
            request.Headers.Add("Cookie", $"access_token={token}");

            var response = await _httpClient.SendAsync(request);
            
            if (response.IsSuccessStatusCode)
            {
                // Parse the nested Django response
                var apiResponse = await response.Content.ReadFromJsonAsync<DjangoMatchingResponse>();
                
                if (apiResponse?.Context?.UserObj != null)
                {
                    _currentIter = apiResponse.Context.NextIter;
                    MainThread.BeginInvokeOnMainThread(() =>
                    {
                        Users.Clear();
                        // Note: your Django view sends ONE user at a time (other_users[iter])
                        // So we add that single user to the collection
                        Users.Add(apiResponse.Context.UserObj);
                    });
                }
            }
            else
            {
                await Shell.Current.DisplayAlertAsync("Server Error", $"Status: {response.StatusCode}", "OK");
            }
        }
        catch (Exception ex) 
        {
            await Shell.Current.DisplayAlertAsync("Error", ex.Message, "OK");
        }
    }
}

#region Data Models

// This matches the top-level Django response: {"status": "...", "context": {...}}
public class DjangoMatchingResponse
{
    [JsonPropertyName("status")]
    public string Status { get; set; }

    [JsonPropertyName("context")]
    public MatchingContext Context { get; set; }
}

// This matches the 'context' key in your Python dictionary
public class MatchingContext
{
    [JsonPropertyName("user_obj")]
    public UserProfile UserObj { get; set; }

    [JsonPropertyName("next_iter")]
    public int NextIter { get; set; }

    [JsonPropertyName("like_status")]
    public string LikeStatus { get; set; }
}

public class UserProfile
{
    [JsonPropertyName("id")]
    public int Id { get; set; }

    [JsonPropertyName("email")]
    public string Email { get; set; }

    [JsonPropertyName("username")]
    public string Username { get; set; }

    [JsonPropertyName("introduction")]
    public string Introduction { get; set; }

    [JsonPropertyName("descriptions")]
    public string Descriptions { get; set; }

    [JsonPropertyName("year_of_study")]
    public int? YearOfStudy { get; set; }

    [JsonPropertyName("faculty")]
    public string Faculty { get; set; }

    [JsonPropertyName("program")]
    public string Program { get; set; }

    [JsonPropertyName("interests")]
    public List<string> Interests { get; set; } = new(); // Changed from string to List<string>
    public string InterestsDisplay => Interests != null ? string.Join(", ", Interests) : "No interests listed";

    [JsonPropertyName("cgpa")]
    public double? Cgpa { get; set; }

    // Helper property to bind to your XAML Label Text="{Binding Name}"
    public string Name => Username;
}
#endregion