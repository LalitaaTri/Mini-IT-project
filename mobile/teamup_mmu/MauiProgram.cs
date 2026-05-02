using Microsoft.Extensions.Logging;

namespace teamup_mmu;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
			});

#if DEBUG
		builder.Logging.AddDebug();
#endif
		builder.Services.AddSingleton<AuthService>();
		builder.Services.AddTransient<SignupPage>();
		builder.Services.AddTransient<MainPage>(); // Register the page too!
		return builder.Build();
	}
}
