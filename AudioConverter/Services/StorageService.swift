import Foundation

final class StorageService {
    
    private let onboardingKey = "hasOnboarding"
    
    var hasOnboarding: Bool {
        get {
            UserDefaults.standard.bool(forKey: onboardingKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: onboardingKey)
        }
    }
}
