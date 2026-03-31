import SwiftUI

struct MainScreen: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
            ZStack {
                VStack(spacing: 10) {
                    SegmentedControl()
                    SearchTextField()
                    ScrollView(showsIndicators: false) {
                        ForEach(
                            viewModel.selectedSection == .allFiles
                            ? viewModel.uploadedFiles
                            : viewModel.convertedFiles
                        ) { file in
                            FileItemBlock(title: "\(file.name).\(file.format)", date: file.date)
                        }
                    }
                    .opacity(viewModel.showEmptyView() ? 0 : 1)
                    
                    Spacer()
                    
                    Button("Import File") { }
                        .buttonStyle(GlobalButtonStyle())
                }
                
                EmptyFilesView()
                    .opacity(viewModel.showEmptyView() ? 1 : 0)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .background(Color.mainBackground)
            .safeAreaInset(edge: .top) {
                CustomNavBar(title: "Home") {
                } rightAction: {}
            }
    }
}


#Preview {
    MainCoordinatorView()
        .environmentObject(MainCoordinator(viewModel: MainViewModel(), container: AppContainer()))
}
