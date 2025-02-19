import SwiftUI

struct TagView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand
    @ObservedObject private var borderManager = BorderManager.shared
    
    enum TagStyle {
        case active(ColorToken)
        case inactive, warning, success
    }
    
    enum IconPosition {
        case left, right
    }
    
    let text: String
    let style: TagStyle
    let icon: Image?
    let iconPosition: IconPosition?

    init(
        text: String,
        style: TagStyle,
        icon: Image? = nil,
        iconPosition: IconPosition? = nil
    ) {
        self.text = text
        self.style = style
        self.icon = icon
        self.iconPosition = iconPosition
    }
    
   

    var cornerRadius: CGFloat {
            guard let borderTokens = borderManager.tokens(for: brand) else { return 0 }
            
            let cornerMapping: [Brand: CGFloat] = [
                .de: borderTokens.borderRadius.full,
                .reliant: borderTokens.borderRadius.s
            ]
            
            return cornerMapping[brand] ?? 0
        }

    var backgroundColor: Color {
        switch style {
        case .active(let colorToken):
            return colorToken.color(brand: brand, colorScheme: colorScheme)
        case .inactive:
            return ColorToken.grayscale300.color(brand: brand, colorScheme: colorScheme)
        case .warning:
            return ColorToken.redLight.color(brand: brand, colorScheme: colorScheme)
        case .success:
            return ColorToken.greenLight.color(brand: brand, colorScheme: colorScheme)
        }
    }
    
    var textColor: Color {
        switch style {
        case .active:
            return ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
        case .inactive:
            return ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme)
        case .warning:
            return ColorToken.redAccessible.color(brand: brand, colorScheme: colorScheme)
        case .success:
            return ColorToken.greenBase.color(brand: brand, colorScheme: colorScheme)
        }
    }

    var body: some View {
        HStack(spacing: 6) {
            if let icon = icon, iconPosition == .left {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
            }
            
            Text(text)
                .font(.system(size: 13, weight: .medium))
            
            if let icon = icon, iconPosition == .right {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 5)
        .background(backgroundColor)
        .foregroundColor(textColor)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

