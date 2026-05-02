namespace teamup_mmu;

public partial class App : Application
{
    public App(AuthService authService)
    {
        InitializeComponent();
        
        // Run the async load on a background task 
        // to "hydrate" the cookies before the first page loads
        Task.Run(async () => await authService.LoadTokenIntoCookiesAsync()).Wait();
    }

    protected override Window CreateWindow(IActivationState? activationState)
    {
        // This is the modern way. 
        // It creates a new Window and sets AppShell as its root.
        return new Window(new AppShell());
    }
}