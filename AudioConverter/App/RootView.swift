import SwiftUI
import Combine

struct RootView: View {
    
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            switch coordinator.flow {
            case .splash:
                SplashView(viewModel: container.makeSplashViewModel())
            case .onboarding:
                OnboardingView(viewModel: container.makeOnboardingViewModel())
            case .subscription:
                SubscriptionView(viewModel: container.makeSubscriptionViewModel())
            case .main:
                MainCoordinatorView()
                    .environmentObject(container.mainCoordinator)
            }
        }
        .task {
            await coordinator.start()
        }
    }
}

