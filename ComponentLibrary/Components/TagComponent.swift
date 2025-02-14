import SwiftUI

struct TagView: View {
    enum TagStyle {
        case active(ColorToken)
        case inactive, warning, success
    }
    
    enum IconPosition {
        case left, right
    }
    
    let text: String
    let style: TagStyle
    let selectedBrand: Brand
    let icon: Image?  // Optional icon
    let iconPosition: IconPosition?  // Optional position

    init(
        text: String,
        style: TagStyle,
        selectedBrand: Brand,
        icon: Image? = nil,   // Default is nil
        iconPosition: IconPosition? = nil  // Default is nil
    ) {
        self.text = text
        self.style = style
        self.selectedBrand = selectedBrand
        self.icon = icon
        self.iconPosition = iconPosition
    }
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var borderManager = BorderManager.shared

    /// Corrected `cornerRadius` property
    var cornerRadius: CGFloat {
        if let borderTokens = borderManager.tokens(for: selectedBrand) {  // ✅ Fixed incorrect parameter
            switch selectedBrand {
            case .de:
                return borderTokens.borderRadius.full
            case .reliant:
                return borderTokens.borderRadius.s
            }
        }
        return 0 // Provide a default value if borderTokens is nil
    }

    /// Corrected `backgroundColor` property
    var backgroundColor: Color {
        switch style {
        case .active(let colorToken):
            return colorToken.color(brand: selectedBrand, colorScheme: colorScheme)
        case .inactive:
            return ColorToken.grayscale300.color(brand: selectedBrand, colorScheme: colorScheme)
        case .warning:
            return ColorToken.redLight.color(brand: selectedBrand, colorScheme: colorScheme)
        case .success:
            return ColorToken.greenLight.color(brand: selectedBrand, colorScheme: colorScheme)
        }
    }  // ✅ Corrected misplaced bracket

    /// Corrected `textColor` property
    var textColor: Color {
        switch style {
        case .active:
            return ColorToken.grayscale000.color(brand: selectedBrand, colorScheme: colorScheme)
        case .inactive:
            return ColorToken.grayscale900.color(brand: selectedBrand, colorScheme: colorScheme)
        case .warning:
            return ColorToken.redAccessible.color(brand: selectedBrand, colorScheme: colorScheme)
        case .success:
            return ColorToken.greenBase.color(brand: selectedBrand, colorScheme: colorScheme)
        }
    }

    /// The main `body` View
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

