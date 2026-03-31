import SwiftUI

struct FirstSlide: View {
    
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("AudioCraftor")
                .foregroundStyle(.mainButton)
                .font(.system(size: 34, weight: .bold))
            
            VStack(spacing: 20) {
                FileItemBlock(title: "SmallJohn.wav")
                
                Text("Convert to:")
                    .font(.system(size: 17, weight: .semibold))
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.iconFiles, id: \.self) { item in
                        
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.white)
                            Image("\(item)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                                .shadow(radius: 5)
                        }
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(12)
                    }
                }
            }
        }
        .padding(20)
    }
}

