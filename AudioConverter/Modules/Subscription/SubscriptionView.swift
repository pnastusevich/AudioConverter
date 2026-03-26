import SwiftUI

struct SubscriptionView: View {
    
    @StateObject var viewModel: SubscriptionViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button(action: {
                viewModel.closeButtonTapped()
            }, label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white.opacity(0.7))
                    .frame(width: 20, height: 20)
                    .padding(20)
            })
            
            VStack(alignment: .center, spacing: 0) {
                Image("subsPattern")
                    .resizable()
                    .scaledToFill()
                
                SubscriptionTerms()
                    .padding(20)
                
                Spacer()
                
                GetSubscription()
                
                Text("Cancel anytime")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.black.opacity(0.5))

                Button("Continue") {
                    viewModel.continueButtonTapped()
                }
                .buttonStyle(GlobalButtonStyle())
                .padding(20)
                
                PrivacyButtons()
            }
            .padding(.vertical, 20)
        }
        .background(content: {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .secondBackground, location: 0.3),
                            .init(color: .mainBackground, location: 0.6)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()
        })
        .environmentObject(viewModel)
    }
}

struct GetSubscription: View {
    
    @EnvironmentObject var viewModel: SubscriptionViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Get Full Access")
                .font(.system(size: 22, weight: .bold))
            
            Text("Audio & Video edit without linites")
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(.black.opacity(0.5))
            
            SubsSelection(title: "Weekly",
                          price: "$5.49",
                          isSelected: viewModel.selectedPlan == .weakly,
                          action:  { viewModel.selectWeakly() }
            )
            SubsSelection(title: "Yearly",
                          price: "$44.49 / week",
                          subTitle: "Best offer",
                          isSelected: viewModel.selectedPlan == .yearly,
                          action: { viewModel.selectYearly() }
            )
        }
        .padding(20)
    }
}

struct SubsSelection: View {
    
    let title: String
    let price: String
    var subTitle: String = ""
    var isSelected: Bool
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundStyle(isSelected ? .secondBackground : .black)
                        
                        if !subTitle.isEmpty {
                            Text(subTitle)
                                .font(.system(size: 13, weight: .regular))
                                .foregroundStyle(.black.opacity(0.5))
                        }
                    }
                    
                    Spacer()
                    
                    Text(price)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(isSelected ? .secondBackground : .black)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(isSelected ? Color.secondBackground : Color.black.opacity(0.15), lineWidth: isSelected ? 3 : 1)
                )
                
                HStack {
                    Spacer()
                    
                    Rectangle()
                        .fill(Color.black.opacity(0.5))
                        .frame(height: 25)
                        .frame(width: 1)
                        .padding(.leading, 40)
                    Spacer()
                }

            }
        })
        .buttonStyle(.plain)
    }
}

struct PrivacyButtons: View {
    var body: some View {
        HStack(spacing: 30) {
            Button("Terms of Use") {  }
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.black.opacity(0.5))
                .buttonStyle(.plain)
            
            Button("Privacy Police") {  }
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.black.opacity(0.5))
                .buttonStyle(.plain)
            
            Button("Restore") {  }
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.black.opacity(0.5))
                .buttonStyle(.plain)
        }

    }
}

struct SubscriptionTerms: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SubscriptionTerm(image: "🔓", title: "Unlimited Conversions", subtitle: "Convert as many audio and video files\nas you want – with no format limits")
            
            SubscriptionTerm(image: "🎚️", title: "Advanced Audio Enhancer", subtitle: "Enhance sound quality using tools like\nNoise Reducer and Smart Enhancer")
            
            SubscriptionTerm(image: "💾", title: "No-Limit File Storage", subtitle: "Your converted files stay safe in the app.\nNo history caps, no auto-deletes")
        }
        .padding(.horizontal, 20)
    }
}

struct SubscriptionTerm: View {

    let image: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(image)
                .font(.system(size: 18, weight: .bold))
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                
                Text(subtitle)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.white.opacity(0.8))
                    .fixedSize(horizontal: false, vertical: true)
                
            }
        }
    }
}

#Preview {
    SubscriptionView(viewModel: SubscriptionViewModel(service: SubscriptionService(), coordinator: AppCoordinator(container: AppContainer())))
}

