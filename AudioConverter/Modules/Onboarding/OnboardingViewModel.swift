import Combine

enum OnboardingSlide: Codable {
    case first
    case second
    case third
    case fourth
}

enum OnboardingContent: String {
    case firstSlideTitle = "User choice\n"
    case firstSlideTitle2 = "AudioCraftor"
    case firstSlideDescription = "Convert audio & video files to MP3, M4A,\nWAV, and more – quick, clean, and offline"
    
    case secondSlideTitle = "Import\n"
    case secondSlideTitle2 = "Any File"
    case secondSlideDescription = "Choose audio or video from apps, links, or\nyour media – we’ll handle the rest"
    
    case thirdSlideTitle = "We Value\n"
    case thirdSlideTitle2 = "Your Feedback"
    case thirdSlideDescription = "Share your opinion about\nour app AudioCraftor"
        
    case fourthSlideTitle = "Get Full\n"
    case fourthSlideTitle2 = "Premium Access"
    case fourthSlideDescription = "Discover the premium features of our app,\nAudioConverter!"
}

enum ImageIconFiles: String, CaseIterable {
    case iconFiles1 = "iconFiles1"
    case iconFiles2 = "iconFiles2"
    case iconFiles3 = "iconFiles3"
    case iconFiles4 = "iconFiles4"
    case iconFiles5 = "iconFiles5"
    case iconFiles6 = "iconFiles6"
    case iconFiles7 = "iconFiles7"
    case iconFiles8 = "iconFiles8"
    case iconFiles9 = "iconFiles9"
}

final class OnboardingViewModel: ObservableObject {
    
    @Published var currentSlide: OnboardingSlide = .first
    var iconFiles: Array = ImageIconFiles.allCases
    
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
         self.coordinator = coordinator
    }
    
    func changeTitle() -> String {
        switch currentSlide {
        case .first:
            OnboardingContent.firstSlideTitle.rawValue
        case .second:
            OnboardingContent.secondSlideTitle.rawValue
        case .third:
            OnboardingContent.thirdSlideTitle.rawValue
        case .fourth:
            OnboardingContent.fourthSlideTitle.rawValue
        }
    }
    
    func changeSecondTitle() -> String {
        switch currentSlide {
        case .first:
            OnboardingContent.firstSlideTitle2.rawValue
        case .second:
            OnboardingContent.secondSlideTitle2.rawValue
        case .third:
            OnboardingContent.thirdSlideTitle2.rawValue
        case .fourth:
            OnboardingContent.fourthSlideTitle2.rawValue

        }
    }
    
    func changeDescription() -> String {
        switch currentSlide {
        case .first:
            OnboardingContent.firstSlideDescription.rawValue
        case .second:
            OnboardingContent.secondSlideDescription.rawValue
        case .third:
            OnboardingContent.thirdSlideDescription.rawValue
        case .fourth:
            OnboardingContent.fourthSlideDescription.rawValue
        }
    }

    func tapButton() {
        switch currentSlide {
        case .first:
            currentSlide = .second
        case .second:
            currentSlide = .third
        case .third:
            currentSlide = .fourth
        case .fourth:
            openSubscription()
        }
    }
    private func openSubscription() {
        coordinator.finishOnboarding()
    }
}
