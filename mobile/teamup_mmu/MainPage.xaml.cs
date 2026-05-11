using System.Net.Http.Json;
using teamup_mmu.Features.MatchingView;
namespace teamup_mmu;

public partial class MainPage : ContentPage
{
    private readonly AuthService _authService;

    public MainPage(AuthService authService, MatchingViewModel vm) // Inject the service, not the client
    {
        InitializeComponent();
        _authService = authService;
        BindingContext = vm;
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
        else
        {
            // 3. SUCCESS: Redirect to the Matching Page
            // Use "//" to reset the navigation stack so the "MainPage" isn't behind it
            await Shell.Current.GoToAsync("//matching_page");
        }
    }

}