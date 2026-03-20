import SwiftUI

@main
struct AudioConverterApp: App {
    
    @StateObject private var container = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(container)
                .environmentObject(container.appCoordinator)
        }
    }
}
