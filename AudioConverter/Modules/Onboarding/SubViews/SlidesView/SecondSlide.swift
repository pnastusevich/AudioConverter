import SwiftUI

struct SecondSlide: View {
    
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
            VStack(spacing: 10) {
                
                Group {
                    FileItemBlock(title: "SmallJohn.mp4", date: "14 Oct 2025, 8:30 PM")
                    FileItemBlock(title: "BigMaria.avi", date: "15 Oct 2025, 9:00 AM")
                    FileItemBlock(title: "MediumAlex.mov", date: "16 Oct 2025, 10:15 AM")
                }
                .padding(.horizontal, 20)
                
                SecondSlideItems()
                Spacer()
            }
            .padding(.top, 20)
    }
}

struct SecondSlideItems: View  {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                SecondSlideItem(title: "Another App", image: "square.grid.2x2.fill", color: .red)
                SecondSlideItem(title: "URL", image: "link", color: .blue)
            }
            HStack(spacing: 15) {
                SecondSlideItem(title: "Photos", image: "photo", color: .orange)
                SecondSlideItem(title: "Music", image: "airpods.max", color: .purple)
            }
            SecondSlideItem(title: "Files", image: "arrow.trianglehead.clockwise.icloud", color: .green)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .white, location: 0.55),
                            .init(color: .mainBackground, location: 0.68)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        )
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 10)
    }
}

struct SecondSlideItem: View {
    let title: String
    let image: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .foregroundStyle(.white)
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Spacer()
            }
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.white)
        }
        .padding(20)
        .background(color)
        .cornerRadius(16)
    }
}


#Preview {
    OnboardingView(viewModel: OnboardingViewModel(coordinator: AppCoordinator(container: AppContainer())))
}
