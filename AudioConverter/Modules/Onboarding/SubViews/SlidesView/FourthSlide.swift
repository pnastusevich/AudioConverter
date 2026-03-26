import SwiftUI

struct FourthSlide: View {
    var body: some View {
        VStack {
            Group {
                Text("All-in-One\n")
                    .foregroundStyle(.black) +
                Text("Auto Format Suggestions")
                    .foregroundStyle(.mainButton)
            }
            .font(.system(size: 28, weight: .bold))
            .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 20) {
                FourthSlideText(image: "🔓", title: "Unlimited Conversions", subtitle: "Convert as many audio and video files as you want – with no format limits")
                
                FourthSlideText(image: "🎚️", title: "Advanced Audio Enhancer", subtitle: "Enhance sound quality using tools like Noise Reducer and Smart Enhancer")
                
                FourthSlideText(image: "💾", title: "No-Limit File Storage", subtitle: "Your converted files stay safe in the app. No history caps, no auto-deletes")
                
                FourthSlideText(image: "✨", title: "Exclusive Format Support", subtitle: "Access premium formats (like FLAC, AIFF, and OGG) and get the best fidelity")
                
                FourthSlideText(image: "🚀", title: "Priority updates", subtitle: "Enjoy faster conversion speed and priority access to future updates")
            }
            .padding(20)
        }
        .padding(20)
    }
}

struct FourthSlideText: View {

    let image: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(image)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.black)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.black)
                
                Text(subtitle)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.black.opacity(0.6))
                
            }
        }
    }
}
