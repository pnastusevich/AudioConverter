import SwiftUI

struct OnboardingView: View {
    
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    switch viewModel.currentSlide {
                    case .first:
                        FirstSlide()
                    case .second:
                        SecondSlide()
                    case .third:
                        ThirdSlide()
                    case .fourth:
                        FourthSlide()
                    }
                }
                .animation(.easeInOut(duration: 0.35),
                           value: viewModel.currentSlide)
                Spacer()
            }
            
            ContentBlock()
                .padding(20)
                .animation(.easeInOut(duration: 0.35),
                           value: viewModel.currentSlide)
        }
        .background(Color.mainBackground)
        .environmentObject(viewModel)
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel(coordinator: AppCoordinator(container: AppContainer())))
}
