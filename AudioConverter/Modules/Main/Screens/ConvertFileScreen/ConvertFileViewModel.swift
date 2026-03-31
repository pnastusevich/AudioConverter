import Combine

final class ConvertFileViewModel: ObservableObject {
    
    @Published var file: ModelFiles

    init(file: ModelFiles) {
        self.file = file
    }
}

