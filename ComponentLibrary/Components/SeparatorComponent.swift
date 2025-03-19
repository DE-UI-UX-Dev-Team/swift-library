import SwiftUI
 
enum SeparatorType {
    case horizontal, vertical
}
 
struct Separator: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
    
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
        let separatorColor = colorToken( brand == .de ?.borderDefaultSecondary:.borderDefaultTertiary)
 
        if type == .horizontal {
            HStack(spacing: label == nil ? 0 : 8) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(separatorColor)
                
                if let label = label {
                    Text(label)
                        .typographyStyle(.p2)
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
                            .typographyStyle(.p2)
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
