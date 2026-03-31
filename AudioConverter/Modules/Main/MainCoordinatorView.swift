import SwiftUI
import Combine

final class MainCoordinator: ObservableObject {
    @Published var viewModel: MainViewModel
    @Published var navigationPath = NavigationPath()
    
    let container: AppContainer
    
    init(viewModel: MainViewModel, container: AppContainer) {
        self.viewModel = viewModel
        self.container = container
    }
    
    func push(_ destination: MainRoute) {
        navigationPath.append(destination)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
    
    func popToRoot() {
        navigationPath = NavigationPath()
    }
    
}

struct MainCoordinatorView: View {
    
    @EnvironmentObject var coordinator: MainCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            MainScreen()
                .environmentObject(coordinator.viewModel)
                .navigationDestination(for: MainRoute.self) { route in
                    switch route {
                    case .fileDetail(let file):
                        DetailFileScreen()
                            .environmentObject(coordinator.container.makeDetailFileViewModel(file))
                    case .importFile:
                        ImportNewFileScreen()
                    case .settings:
                        SettingsFileScreen()
                    case .convertFile(let file):
                        ConvertFileScreen()
                            .environmentObject(coordinator.container.makeCovertFileViewModel(file))
                    }
                }
        }
    }
}



enum MainRoute: Hashable {

    case fileDetail(ModelFiles)
    case importFile
    case settings
    case convertFile(ModelFiles)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .importFile:
            hasher.combine("importFile")
        case .settings:
            hasher.combine("settings")
        case .fileDetail(let file):
            hasher.combine("fileDetail")
            hasher.combine(file.id)
        case .convertFile(let file):
            hasher.combine("fileConvert")
            hasher.combine(file.id)
        }
    }
    
    static func == (lhs: MainRoute, rhs: MainRoute) -> Bool {
        switch (lhs, rhs) {
        case (.importFile, .importFile):
            return true
        case (.settings, .settings):
            return true
        case (.fileDetail(let file1), .fileDetail(let file2)):
            return file1.id == file2.id
        case (.convertFile(let file1), .convertFile(let file2)):
            return file1.id == file2.id
        default:
            return false
        }
    }
}
