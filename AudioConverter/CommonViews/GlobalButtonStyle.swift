import SwiftUI

struct GlobalButtonStyle: ButtonStyle {
    
    var color: Color = .mainButton
    var isEnabled: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(
                         Group {
                             if !isEnabled {
                                 Color(color).opacity(0.3)
                             } else if configuration.isPressed {
                                 Color(color).opacity(0.7)
                             } else {
                                 Color(color)
                             }
                         }
                     )
            .foregroundStyle(.white)
            .font(.system(size: 17, weight: .bold))
            .cornerRadius(16)
            .scaleEffect(configuration.isPressed && isEnabled ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .animation(.easeOut(duration: 0.2), value: isEnabled)
    }
}
