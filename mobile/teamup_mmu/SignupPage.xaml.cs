using System.Net;
using System.Text;
using System.Text.Json;

namespace teamup_mmu;

public partial class SignupPage : ContentPage
{
	private readonly AuthService _authService;

	public SignupPage(AuthService authService)
	{
		InitializeComponent();
		_authService = authService;
	}
	private async void OnLoginClicked(object sender, EventArgs e)
	{
		var email = EmailEntry.Text;
		var password = PasswordEntry.Text;

		StatusLabel.Text = "Logging in...";

		// 1. Send to Backend
		var result = await _authService.LoginAsync(email, password);
		if (result?.status == "success")
        {
            _authService.DebugCookies();
            await _authService.PersistTokenAsync();

			await DisplayAlertAsync("Welcome",result?.message,"OK");
            if (result?.action == "redirect" && !string.IsNullOrWhiteSpace(result.target))
            {
                await Shell.Current.GoToAsync($"//{result.target.Trim('/')}");
            }
            else
            {
                await DisplayAlertAsync("Info", result?.message ?? "Success", "OK");
            }
        }
		else
		{
			await DisplayAlertAsync("Login failed", result?.message ?? "Login failed", "Try again");
		}
	}

}
