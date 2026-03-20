import Combine

final class SubscriptionViewModel: ObservableObject {
 
    let service: SubscriptionService
    private let coordinator: AppCoordinator

    init(service: SubscriptionService, coordinator: AppCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
}
