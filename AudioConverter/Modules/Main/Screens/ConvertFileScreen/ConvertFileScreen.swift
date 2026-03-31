import SwiftUI

struct ConvertFileScreen: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @EnvironmentObject var viewModel: ConvertFileViewModel
    
    var body: some View {
        ZStack {
            VStack {
                
                FileItemBlock(title: "\(viewModel.file.name).\(viewModel.file.format)")
                        
                HStack {
                    Text("Convert to:")
                        .font(.system(size: 17, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.formats, id: \.self) { item in
                
                        Button { viewModel.tapFormat(item) } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(.white)
                                Image("\(item.imageName)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)
                                    .opacity(viewModel.selectedFormat == item ? 0.5 : 1)
                                    .shadow(radius: 5)
                            }
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(12)
                        }
                    }
                }
                
                Spacer()
                
                
                Button {
                    viewModel.convertFile()
                } label: {
                    Text("Covert")
                }
                .buttonStyle(GlobalButtonStyle(color: .blue, isEnabled: viewModel.isConvertEnabled))
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.mainBackground)
        .safeAreaInset(edge: .top) {
            CustomNavBar(title: "Output Format", isEditFile: true) {} rightAction: {}
        }
    }
}


#Preview {
    ConvertFileScreen()
        .environmentObject(ConvertFileViewModel(file: ModelFiles.init(name: "SmallJohn", format: "flac", date: "")))
}
