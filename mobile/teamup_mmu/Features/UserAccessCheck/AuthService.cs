using System.Net;
using System.Text;
using System.Text.Json;

namespace teamup_mmu;


public class BackendResponse
{
    public bool passed_login_check { get; set; } //
    public string message { get; set; } = string.Empty;
    public string status { get; set; } = string.Empty;
    public string? action { get; set; }
    public string? target { get; set; }
}

public class AuthService
{
    private HttpClient _httpClient;
    private CookieContainer _cookieContainer;
    private const string BaseUrl = "http://192.168.100.149:8000";
    private readonly Uri _serverUri = new Uri(BaseUrl);

    public AuthService()
    {
        _cookieContainer = new CookieContainer();
        var handler = new HttpClientHandler { CookieContainer = _cookieContainer };
        _httpClient = new HttpClient(handler) { BaseAddress = _serverUri };
    }
    public bool HasAccessToken()
    {
        var cookies = _cookieContainer.GetCookies(_serverUri);
        // Use LINQ to check if the specific cookie exists
        return cookies.Cast<System.Net.Cookie>().Any(c => c.Name == "access_token");
    }

    public async Task SaveTokenAsync(string token)
    {
        // Stores the token securely in the device's Keychain (iOS) or SharedPrefs (Android)
        await SecureStorage.Default.SetAsync("access_token", token);
    }

    public async Task LoadTokenIntoCookiesAsync()
    {
        // Adding the '?' tells C# we expect this might be null
        string? token = await SecureStorage.Default.GetAsync("access_token");

        // Only attempt to use the token if it actually exists
        if (!string.IsNullOrEmpty(token))
        {
            _cookieContainer.Add(_serverUri, new System.Net.Cookie("access_token", token));
        }
    }

    public async Task PersistTokenAsync()
    {
        // Get all cookies associated with your Django server URL
        var cookies = _cookieContainer.GetCookies(_serverUri);
        
        // Find the one named access_token
        var tokenCookie = cookies.Cast<System.Net.Cookie>()
                                .FirstOrDefault(c => c.Name == "access_token");

        if (tokenCookie != null && !string.IsNullOrEmpty(tokenCookie.Value))
        {
            await SecureStorage.Default.SetAsync("access_token", tokenCookie.Value);
        }
    }

    public async Task LogoutAsync()
    {
        try
        {
            // 1. Clear the persistent SecureStorage
            SecureStorage.Default.Remove("access_token");

            // 2. Reset the CookieContainer in memory
            // We create a new handler and client to effectively wipe all active session cookies
            _cookieContainer = new CookieContainer();
            var handler = new HttpClientHandler { CookieContainer = _cookieContainer };
            
            // Note: We reuse the existing BaseAddress
            var oldBaseAddress = _httpClient.BaseAddress;
            _httpClient = new HttpClient(handler) { BaseAddress = oldBaseAddress };
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Logout error: {ex.Message}");
        }
    }

    public async Task<bool> CheckSessionAsync()
    {
        try
        {
            var response = await _httpClient.GetAsync("/access_check/");
            
            if (response.IsSuccessStatusCode)
            {
                var json = await response.Content.ReadAsStringAsync();
                // Deserialize the JSON string into our BackendResponse object
                var result = System.Text.Json.JsonSerializer.Deserialize<BackendResponse>(json);
                
                // Return the boolean from your Django dictionary
                return result?.passed_login_check == true;
            }
            return false;
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Session check failed: {ex.Message}");
            return false;
        }
    }

    public async Task<BackendResponse?> LoginAsync(string email, string password)
    {
        try
        {
            var content = new StringContent(JsonSerializer.Serialize(new { email, password }), Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync("/user_login/receive/", content);
            var json = await response.Content.ReadAsStringAsync();
            return JsonSerializer.Deserialize<BackendResponse>(json);
        }
        catch (Exception ex)
        {
            return new BackendResponse { status = "error", message = ex.Message };
        }
    }

    public void DebugCookies()
    {
        var cookies = _cookieContainer.GetCookies(_serverUri);
        var sb = new StringBuilder();
        foreach (Cookie cookie in cookies) sb.AppendLine($"{cookie.Name}: {cookie.Value}");
        
        MainThread.BeginInvokeOnMainThread(async () => {
            await Shell.Current.DisplayAlertAsync("Cookies", sb.Length > 0 ? sb.ToString() : "None", "OK");
        });
    }
}
