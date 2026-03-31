import SwiftUI

struct FileItemBlock: View {
    
    let title: String
    var date: String = ""
    var action: (() -> Void)?
    
    var body: some View {
        HStack {
            Image(.fileIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 38, height: 38)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.black)
                if !date.isEmpty {
                    Text(date)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.black.opacity(0.4))
                }
            }
            
            Spacer()
            
            Button(action: {
                action?()
            }) {
                Image(systemName: "ellipsis")
                    .font(.system(size: 20, weight: .semibold))
                    .scaledToFill()
                    .foregroundStyle(.black.opacity(0.5))
            }
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(12)
    }
}

