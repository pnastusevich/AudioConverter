import SwiftUI
import Combine

struct DetailFileScreen: View {
    
    @EnvironmentObject var viewModel: DetailFileViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                FileItemBlock(title: "\(viewModel.file.name).\(viewModel.file.format)")
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.interactions, id: \.self) { item in
                        Button { viewModel.tapOnButtons(item) } label: {
                            Text(item.title)
                        }
                        .buttonStyle(GlobalButtonStyle(color: item.color))
                    }
                }
                
                Spacer()
                
                Button {
                } label: {
                    Text("Delete")
                }
                .buttonStyle(GlobalButtonStyle(color: .secondButton))
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.mainBackground)
        .safeAreaInset(edge: .top) {
            CustomNavBar(title: "Complete", isEditFile: true) {} rightAction: {}
        }
    }
}

#Preview {
    DetailFileScreen()
        .environmentObject(DetailFileViewModel(file: ModelFiles.init(name: "SmallJohn", format: "flac", date: "")))
}

