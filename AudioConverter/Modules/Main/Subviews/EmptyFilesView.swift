
import SwiftUI

struct EmptyFilesView: View {
    var body: some View {
        VStack {
            Image(.homeEmptyIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            Text("No files added yet")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.black.opacity(0.4))
            
        }
    }
}
