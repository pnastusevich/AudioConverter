import SwiftUI

struct ContentBlock: View {
    
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0.55),
                            .init(color: .mainBackground, location: 0.68)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                VStack(spacing: 10) {
                    Group {
                        Text(viewModel.changeTitle())
                            .foregroundStyle(.black) +
                        Text(viewModel.changeSecondTitle())
                            .foregroundStyle(.mainButton)
                    }
                    .font(.system(size: 28, weight: .heavy))
                    .multilineTextAlignment(.center)
                    
                    Text(viewModel.changeDescription())
                        .foregroundStyle(.black.opacity(0.6))
                        .font(.system(size: 17, weight: .light))
                        .multilineTextAlignment(.center)
                }
                
                Button("Continue") {
                    viewModel.tapButton()
                    
                }
                .buttonStyle(GlobalButtonStyle())
            }
        }
    }
}
