import SwiftUI

struct CustomNavBar: View {
    
    let title: String
    var isEditFile: Bool = false
    var isRightHidden: Bool = false

    let leftAction: (() -> Void)
    let rightAction: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button {
                        leftAction()
                    } label: {
                        if isEditFile {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 28))
                                    .foregroundStyle(.secondBackground)
                                Text("Back")
                                    .font(.system(size: 17))
                                    .foregroundStyle(.secondBackground)
                            }
                        } else {
                            Image(systemName: "gearshape")
                                .font(.system(size: 28))
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Spacer()
                }

                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.black)

                HStack {
                    Spacer()
                    if isRightHidden {
                        Button {
                            rightAction?()
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 28))
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .frame(height: 60)
            .padding(.horizontal, 20)
            
            if isEditFile {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
            }
        }
        .background(Color.mainBackground)
    }
}
