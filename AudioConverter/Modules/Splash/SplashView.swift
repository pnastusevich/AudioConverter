
import SwiftUI

struct SplashView: View {
    
    @StateObject var viewModel: SplashViewModel
    
    var body: some View {
        ZStack {
            Image(.launch)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5)
        }
    }
}

#Preview {
    SplashView(viewModel: SplashViewModel())
}
