import SwiftUI

struct SearchTextField: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 15))
            
            TextField("Search for Files", text: $viewModel.searchText)
                .padding()
                .textFieldStyle(.plain)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(12)
        
    }
}
