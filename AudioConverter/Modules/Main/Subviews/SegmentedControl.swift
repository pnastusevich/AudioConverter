import SwiftUI

struct SegmentedControl: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        Picker("", selection: $viewModel.selectedSection) {
            ForEach(MainViewModel.Section.allCases) { section in
                Text(section.rawValue)
                    .tag(section)
                
            }
        }
        .pickerStyle(.segmented)
        .tint(.mainButton)
    }
}
