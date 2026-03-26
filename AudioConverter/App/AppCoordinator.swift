import SwiftUI
import Combine

enum AppFlow {
    case splash
    case onboarding
    case subscription
    case main
}

@MainActor
final class AppCoordinator: ObservableObject {
    
    @Published var flow: AppFlow = .splash
    
    private let container: AppContainer
    
    init(container: AppContainer) {
        self.container = container
        Task {
            await start()
        }
    }
    
    func start() async {
        flow = .splash
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        let hasOnboarding = container.storage.hasOnboarding
        flow = hasOnboarding ? .main : .onboarding
    }
    
    func showOnboarding() {        
        flow = .onboarding
    }
    
    func showSubscription() {
        flow = .subscription
    }
    
    func showMain() {
        flow = .main
    }
    
    func finishOnboarding() {
        container.storage.onboardingShown()
        flow = .subscription
    }
}

