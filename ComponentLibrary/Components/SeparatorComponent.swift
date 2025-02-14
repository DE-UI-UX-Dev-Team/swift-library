import SwiftUI

enum SeparatorType {
    case horizontal
    case vertical
}

struct SeparatorComponent: View {
    @Environment(\.colorScheme) var colorScheme
    let selectedBrand: Brand
    let type: SeparatorType
    let label: String?

    init(
        selectedBrand: Brand,
        type: SeparatorType = .horizontal,
        label: String? = nil
    ) {
        self.selectedBrand = selectedBrand
        self.type = type
        self.label = label
    }

    var body: some View {
        let separatorColor = ColorToken.grayscale900.color( brand: selectedBrand,
                                                            colorScheme: colorScheme)

        if type == .horizontal {
            HStack(spacing: label == nil ? 0 : 8) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(separatorColor)
                
                if let label = label {
                    Text(label)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(separatorColor)
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(separatorColor)
            }
        } else { //Vertical Separator
            VStack(spacing: label == nil ? 0 : 4) {
                Rectangle()
                    .frame(width: 1)
                    .foregroundColor(separatorColor)
                
                if let label = label {
                    VStack {
                        Text(label)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(separatorColor)
                    
                    }
                }
                
                Rectangle()
                    .frame(width: 1)
                    .foregroundColor(separatorColor)
            }
        }
    }
}

