import Combine
import SwiftUI

final class DetailFileViewModel: ObservableObject {
    
    @Published var file: ModelFiles

    var interactions: [Interaction] = Interaction.allCases

    enum Interaction: CaseIterable {
         case rename
         case share
         case enhance
         case convert
         
         var title: String {
             switch self {
             case .rename: return "Rename"
             case .share: return "Share"
             case .enhance: return "Enhance"
             case .convert: return "Convert"
             }
         }
         
         var color: Color {
             switch self {
             case .rename: return .green
             case .share: return .orange
             case .enhance: return .blue
             case .convert: return .purple
             }
         }
     }
    
    init(file: ModelFiles) {
        self.file = file
    }
    
    func tapOnButtons(_ interaction: Interaction) {
        switch interaction {
        case .rename:
            tapRename()
        case .share:
            tapShare()
        case .enhance:
            tapEnhance()
        case .convert:
            tapConvert()
        }
    }
    
    private func tapConvert() {
        print("convert")
    }
    
    private func tapRename() {
        print("rename")
    }
    
    private func tapShare() {
        print("share")
    }
    
    private func tapEnhance() {
        print("enhance")
    }
}
