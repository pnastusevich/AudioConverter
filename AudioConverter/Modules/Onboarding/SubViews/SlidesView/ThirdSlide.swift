import SwiftUI

struct ThirdSlide: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                Image(.iconTraced)
                
                VStack(spacing: 5) {
                    Text("The highest")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.mainButton)
                    
                    Text("User Choice")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.mainButton)
                }
                Image(.iconTraced)
                    .scaleEffect(x: -1.0, y: 1.0)
            }
            
            VStack(spacing: 20) {
                Image(.iconAvatar)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
                VStack {
                    Text("Andrew K.")
                        .font(.system(size: 17, weight: .semibold))
                    
                    HStack(spacing: 5) {
                        ForEach(1...5, id: \.self) {_ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.mainButton)
                        }
                    }
                }
                Text("🎵 Best Audio Converter App!")
                    .font(.system(size: 16, weight: .medium))
                
                Text("I’ve tested quite a few audio converters, and this one is by far the best! The interface is clean, the process is fast, and the results are crystal clear. It handles both audio and video, supports tons of formats, and even improves the sound quality. I love how easy it is to manage my files and convert them in seconds — all right on my phone 📱🎧")
                    .font(.system(size: 13, weight: .regular))
                    .multilineTextAlignment(.center)
            }
            .padding(25)
            .background(Color.white)
            .cornerRadius(20)
        }
        .padding(20)
        .shadow(color: Color.black.opacity(0.1), radius: 10)

    }
}
