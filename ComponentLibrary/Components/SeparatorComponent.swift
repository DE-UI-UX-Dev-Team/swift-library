import SwiftUI
 
enum SeparatorType {
    case horizontal
    case vertical
}
 
struct SeparatorComponent: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand
    
    let type: SeparatorType
    let label: String?
 
    init(
        type: SeparatorType = .horizontal,
        label: String? = nil
    ) {
        self.type = type
        self.label = label
    }
 
    var body: some View {
        let separatorColor = ColorToken.grayscale900.color( brand: brand,
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
