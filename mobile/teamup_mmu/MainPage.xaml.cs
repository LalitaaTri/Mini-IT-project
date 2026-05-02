using System.Net.Http.Json;
namespace teamup_mmu;

public partial class MainPage : ContentPage
{
    private readonly AuthService _authService;

    public MainPage(AuthService authService) // Inject the service, not the client
    {
        InitializeComponent();
        _authService = authService;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        await Task.Delay(100);

        // 1. Check locally if the cookie even exists
        if (!_authService.HasAccessToken())
        {
            await Shell.Current.GoToAsync("//signup_page");
            return;
        }

        // 2. If it exists locally, ask the server if it's still valid in the DB
        bool isValid = await _authService.CheckSessionAsync();

        if (!isValid)
        {
            await Shell.Current.GoToAsync("//signup_page");
        }
    }

    private async void OnLogoutClicked(object sender, EventArgs e)
    {
        // Confirm with the user first
        bool answer = await DisplayAlertAsync("Logout", "Are you sure you want to log out?", "Yes", "No");
        
        if (answer)
        {
            // 1. Clear the data
            await _authService.LogoutAsync();

            // 2. Redirect to the signup/login page
            // Using // resets the navigation stack so they can't "back" into the app
            await Shell.Current.GoToAsync("//signup_page");
        }
    }
}