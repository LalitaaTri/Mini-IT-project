namespace teamup_mmu.Features.MatchingView;

// It MUST be a partial class and inherit ContentPage
public partial class MatchingView : ContentPage
{
    public MatchingView(MatchingViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm; // This connects the UI to the logic below
    }
}