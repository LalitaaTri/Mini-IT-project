namespace teamup_mmu;

public partial class App : Application
{
    private readonly AppShell _shell;

    // This constructor is called by MAUI. 
    // It automatically grabs the AuthService and AppShell from MauiProgram.
    public App(AppShell shell, AuthService authService)
    {
        InitializeComponent();
        
        _shell = shell; // We save it here

        Task.Run(async () => await authService.LoadTokenIntoCookiesAsync()).Wait();
    }

    protected override Window CreateWindow(IActivationState? activationState)
    {
        // FIX: Pass the variable _shell, NOT 'new AppShell()'
        return new Window(_shell);
    }
}