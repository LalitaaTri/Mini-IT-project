using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace teamup_mmu;

public partial class MatchingViewOld : ContentPage
{
    // 1. Dependency: Reference your AuthService
    // In a real app, you'd use Dependency Injection, but for now, we'll instantiate it
    private readonly AuthService _authService = new AuthService();

    // Initialize with string.Empty to satisfy the non-nullable requirement
    private string _statusMessage = string.Empty;
    public string StatusMessage
    {
        get => _statusMessage;
        set { _statusMessage = value; OnPropertyChanged(); }
    }

    private string _userEmail = string.Empty;
    public string UserEmail
    {
        get => _userEmail;
        set { _userEmail = value; OnPropertyChanged(); }
    }

    private string _likeStatus = string.Empty;
    public string LikeStatus
    {
        get => _likeStatus;
        set { _likeStatus = value; OnPropertyChanged(); }
    }

    private bool _isEmpty = true;
    public bool IsEmpty
    {
        get => _isEmpty;
        set { _isEmpty = value; OnPropertyChanged(); }
    }

    private int _currentIndex = 0;
    private List<string> _mockUsers = new List<string> { "student1@mmu.edu.my", "dev_pro@mmu.edu.my", "coder_girl@mmu.edu.my" };

    public void MatchingViewOldTwo()
    {
        InitializeComponent();
        BindingContext = this;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        
        // 2. Load token from SecureStorage into the HttpClient's CookieContainer
        await _authService.LoadTokenIntoCookiesAsync();
        
        await CheckAccessAndLoadData();
    }

    private async Task CheckAccessAndLoadData()
    {
        // 3. Use your AuthService to ping Django's /access_check/
        bool isLoggedIn = await _authService.CheckSessionAsync();
        // FOR DEBUG ONLY, MAY 4
        isLoggedIn = true;
        //

        if (isLoggedIn)
        {
            StatusMessage = "You are authorized to view matches.";
            LoadUser(_currentIndex);
        }
        else
        {
            StatusMessage = "Please login to see potential teammates.";
            IsEmpty = true;
            UserEmail = string.Empty;
            
            // Optional: Auto-redirect if not logged in
            // await Shell.Current.DisplayAlert("Access Denied", "Please login first", "OK");
        }
    }

    private void LoadUser(int index)
    {
        if (index < _mockUsers.Count)
        {
            UserEmail = _mockUsers[index];
            LikeStatus = "Not liked yet";
            IsEmpty = false;
        }
        else
        {
            UserEmail = "No more users found.";
            LikeStatus = string.Empty;
            IsEmpty = true;
        }
    }

    private void OnLikeClicked(object sender, EventArgs e)
    {
        // HTMX behavior: Update UI immediately
        LikeStatus = "LIKED!";
        
        // TODO: In the next step, we'll add a method to AuthService 
        // to call your Django "/matching/like/" endpoint
    }

    private void OnNextClicked(object sender, EventArgs e)
    {
        _currentIndex++;
        if (_currentIndex >= _mockUsers.Count)
        {
            _currentIndex = 0; 
        }
        LoadUser(_currentIndex);
    }

    protected override void OnPropertyChanged([CallerMemberName] string propertyName = null)
    {
        // This 'base' call triggers the PropertyChanged event 
        // that is already built into MAUI's ContentPage.
        base.OnPropertyChanged(propertyName);
    }
}