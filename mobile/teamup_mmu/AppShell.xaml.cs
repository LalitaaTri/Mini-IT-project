namespace teamup_mmu;

public partial class AppShell : Shell
{
	
    private readonly AuthService _authService;
	public AppShell(AuthService authService)
	{
		InitializeComponent();
        _authService = authService;
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
