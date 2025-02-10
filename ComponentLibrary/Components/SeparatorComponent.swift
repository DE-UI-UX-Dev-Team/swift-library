import SwiftUI

enum SeparatorType {
    case horizontal
    case vertical
}

struct SeparatorComponent: View {
    @Environment(\.colorScheme) var colorScheme
    let selectedBrand: Brand
    let type: SeparatorType
    let label: String? //Optional label

    init(
        selectedBrand: Brand,
        type: SeparatorType = .horizontal,
        label: String? = nil //Default is no label
    ) {
        self.selectedBrand = selectedBrand
        self.type = type
        self.label = label
    }

    var body: some View {
        let separatorColor = ColorToken.grayscale900.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)

        if type == .horizontal {
            HStack(spacing: label == nil ? 0 : 8) { //No extra space if label is nil
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
            VStack(spacing: label == nil ? 0 : 4) { //No extra space if label is nil
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

