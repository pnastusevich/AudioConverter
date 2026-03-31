import Combine

final class AppContainer: ObservableObject {
    
    let subscriptionService: SubscriptionService
    let storage: StorageService
    lazy var appCoordinator = AppCoordinator(container: self)
    lazy var mainCoordinator = MainCoordinator(viewModel: makeMainViewModel(), container: self)

    
    init(subscriptionService: SubscriptionService = SubscriptionService(),
         storage: StorageService = StorageService()) {
        self.subscriptionService = subscriptionService
        self.storage = storage
    }
    
    func makeSplashViewModel() -> SplashViewModel { SplashViewModel() }
    func makeOnboardingViewModel() -> OnboardingViewModel { OnboardingViewModel(coordinator: appCoordinator) }
    func makeSubscriptionViewModel() -> SubscriptionViewModel { SubscriptionViewModel(service: subscriptionService, coordinator: appCoordinator) }
    func makeMainViewModel() -> MainViewModel { MainViewModel() }
    func makeDetailFileViewModel(_ file: ModelFiles) -> DetailFileViewModel {
        DetailFileViewModel(file: file)
    }
    func makeCovertFileViewModel(_ file: ModelFiles) -> ConvertFileViewModel {
        ConvertFileViewModel(file: file)
    }
}
