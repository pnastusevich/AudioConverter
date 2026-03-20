import SwiftUI
import Combine

final class MainCoordinator: ObservableObject {
    @Published var viewModel: MainViewModel
    
    private let container: AppContainer
    
    init(viewModel: MainViewModel, container: AppContainer) {
        self.viewModel = viewModel
        self.container = container
    }
}

struct MainCoordinatorView: View {
    
    @EnvironmentObject var coordinator: MainCoordinator

    var body: some View {
        MainScreen()
            .environmentObject(coordinator.viewModel)
    }
}

struct MainScreen: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        Text("asd")
    }
}
