import Combine

final class OnboardingViewModel: ObservableObject {
    
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
         self.coordinator = coordinator
     }
    
}
