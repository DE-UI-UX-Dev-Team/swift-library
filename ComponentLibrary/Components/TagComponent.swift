import SwiftUI

struct Tag: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand
    
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
    

    var backgroundColor: Color {
        switch style {
        case .active(let colorToken):
            return self.colorToken(colorToken)
        case .inactive:
            return colorToken(.grayscale300)
        case .warning:
            return colorToken(.redLight)
        case .success:
            return colorToken(.greenLight)
        }
    }
    
    var textColor: Color {
        switch style {
        case .active:
            return colorToken(.grayscale000)
        case .inactive:
            return colorToken(.grayscale900)
        case .warning:
            return colorToken(.redAccessible)
        case .success:
            return colorToken(.greenBase)
        }
    }

    var body: some View {
            HStack(spacing: 4) {
                if let icon = icon, iconPosition == .left {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                }

                Text(text)
    //                .font(.system(size: 13, weight: .medium))
                    .typographyStyle(brand == .de ? .p3 : .p1)


                if let icon = icon, iconPosition == .right {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: brand == .de ? cornerRadius.full: cornerRadius.s))
        }
    }

