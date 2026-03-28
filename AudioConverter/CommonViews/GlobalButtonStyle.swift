import SwiftUI

struct GlobalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(configuration.isPressed ? Color(.mainButton).opacity(0.7) : Color(.mainButton))
            .foregroundStyle(.white)
            .font(.system(size: 17, weight: .bold))
            .cornerRadius(16)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel(coordinator: AppCoordinator(container: AppContainer())))
}
