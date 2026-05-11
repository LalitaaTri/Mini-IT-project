using Microsoft.Extensions.Logging;

namespace teamup_mmu;
using teamup_mmu.Features.MatchingView;

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

        // 1. Services (Logic & Data)
        builder.Services.AddSingleton<AuthService>();

        // 2. ViewModels (The "Bridge" between logic and UI)
        // Add this line to fix the "Unable to resolve service" error
		builder.Services.AddTransient<MatchingViewModel>();
		builder.Services.AddTransient<MatchingView>();

        // 3. Pages (UI)
        builder.Services.AddTransient<MainPage>();
        builder.Services.AddTransient<SignupPage>();

        // 4. Shell & App (The Root Architecture)
        builder.Services.AddSingleton<AppShell>();
        builder.Services.AddSingleton<App>();

        return builder.Build();
    }
}