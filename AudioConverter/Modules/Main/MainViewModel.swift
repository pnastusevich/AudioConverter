import Combine
import SwiftUI

struct ModelFiles: Identifiable {
    let id = UUID()
    let name: String
    let format: String
    let date: String
    var isConverted: Bool = false
}

final class MainViewModel: ObservableObject {
    
    enum Section: String, CaseIterable, Identifiable {
        case allFiles = "All Files"
        case converted = "Converted"
        
        var id: String { self.rawValue }
    }
    
    @Published var selectedSection: Section = .allFiles
    @Published var searchText: String = ""
    @Published var uploadedFiles: [ModelFiles] = []
    @Published var convertedFiles: [ModelFiles] = []

    init() {
        loadMockFiles()
    }
    
    func showEmptyView() -> Bool {
        if uploadedFiles.isEmpty {
            return true
        } else {
            return false
        }
    }
}

extension MainViewModel {
    func loadMockFiles() {
        uploadedFiles = [
            ModelFiles(name: "SmallJohn", format: "mp4", date: "14 Oct 2025, 8:30 PM", isConverted: true),
            ModelFiles(name: "BigMaria", format: "avi", date: "15 Oct 2025, 9:00 AM", isConverted: true),
            ModelFiles(name: "MediumAlex", format: "mov", date: "16 Oct 2025, 10:15 AM"),
            ModelFiles(name: "TinyElla", format: "wmv", date: "17 Oct 2025, 11:45 PM"),
            ModelFiles(name: "FastJake", format: "flv", date: "18 Oct 2025, 1:00 PM"),
            ModelFiles(name: "QuickSara", format: "mkv", date: "19 Oct 2025, 2:30 PM"),
            ModelFiles(name: "SwiftTom", format: "webm", date: "20 Oct 2025, 3:30 PM"),
            ModelFiles(name: "LazyPaul", format: "mpeg", date: "21 Oct 2025, 4:30 PM", isConverted: true)
        ]
        
        convertedFiles = uploadedFiles.filter { $0.isConverted }
    }
}
