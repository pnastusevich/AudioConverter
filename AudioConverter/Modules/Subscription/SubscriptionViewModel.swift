import Combine

enum SubscriptionPlans {
    case weakly
    case yearly
}

final class SubscriptionViewModel: ObservableObject {
    
    @Published var selectedPlan: SubscriptionPlans = .weakly
 
    let service: SubscriptionService
    private let coordinator: AppCoordinator

    init(service: SubscriptionService, coordinator: AppCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func selectWeakly() {
        if selectedPlan == .weakly {
           return
        } else {
            selectedPlan = .weakly
        }
    }
    
    func selectYearly() {
        if selectedPlan == .yearly {
           return
        } else {
            selectedPlan = .yearly
        }
    }
    
    func continueButtonTapped() {
        service.hasSubscription = true
    }
    
    func closeButtonTapped() {
        coordinator.flow = .main
    }
}
