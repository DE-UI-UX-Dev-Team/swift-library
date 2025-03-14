import SwiftUI

enum ButtonVariant: CaseIterable {
    case primary, secondary, tertiary, disabled
}


enum ButtonSize {
    case small
}


struct ButtonStyleConfig {
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color
    let typographyStyle: MyTextStyle
    let padding: CGFloat

    static func get(for brand: Brand, variant: ButtonVariant, colorScheme: ColorScheme) -> ButtonStyleConfig {
        guard let style = brandStyles[brand] else {
                  fatalError("No style found for brand: \(brand)")
              }

        return ButtonStyleConfig(
            backgroundColor: style.getColor(for: variant, type: .background,brand: brand, colorScheme: colorScheme),
            foregroundColor: style.getColor(for: variant, type: .foreground, brand: brand,colorScheme: colorScheme),
            borderColor: style.getColor(for: variant, type: .border,brand: brand, colorScheme: colorScheme),
            typographyStyle: .button,
            padding: style.padding
        )
    }

    enum ColorType {
        case background, foreground, border
    }

    struct BrandStyle {
        let colors: [ButtonVariant: [ColorType: ColorToken]]
        let padding: CGFloat

        func getColor(for variant: ButtonVariant, type: ColorType, brand: Brand,colorScheme: ColorScheme) -> Color {
            return colors[variant]?[type]?.color(brand: brand, colorScheme: colorScheme) ?? .clear
        }
    }

     static let brandStyles: [Brand: BrandStyle] = [
        .de: BrandStyle(
            colors: [
                .primary: [.background: .containerFillTertiaryBrand, .foreground: .grayscale900, .border: .grayscale900],
                .secondary: [.background: .containerFillGrayDefault, .foreground: .grayscale900, .border: .grayscale900],
                .tertiary: [.background: .transparent, .foreground: .grayscale900, .border: .transparent],
                .disabled: [.background: .grayscale300, .foreground: .grayscale600, .border: .grayscale300]
            ],
            padding: 16
        ),
        .reliant: BrandStyle(
            colors: [
                .primary: [.background: .primaryBase, .foreground: .grayscale000, .border: .primaryBase],
                .secondary: [.background: .primaryLightest, .foreground: .primaryBase, .border: .primaryLightest],
                .tertiary: [.background: .grayscale000, .foreground: .primaryBase, .border: .primaryBase],
                .disabled: [.background: .grayscale400, .foreground: .grayscale600, .border: .grayscale300]
            ],
            padding: 15
        )
    ]

     static let defaultBrandStyle = BrandStyle(
        colors: [
            .primary: [.background: .primaryBase, .foreground: .grayscale000, .border: .primaryBase],
            .secondary: [.background: .primaryLightest, .foreground: .primaryBase, .border: .primaryLightest],
            .tertiary: [.background: .grayscale000, .foreground: .primaryBase, .border: .primaryBase],
            .disabled: [.background: .grayscale400, .foreground: .grayscale600, .border: .grayscale300]
        ],
        padding:15
    )
}

struct ButtonComponent: View, BrandStyleSupport  {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand

    let title: String
    let variant: ButtonVariant
    let size: ButtonSize?
    let action: () -> Void

    init(
        title: String,
        variant: ButtonVariant = .primary,
        size: ButtonSize? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.variant = variant
        self.size = size
        self.action = action
    }

    var body: some View {
        let styleConfig = ButtonStyleConfig.get(for: brand, variant: variant, colorScheme: colorScheme)
        
        let buttonMaxWidth: CGFloat? = {
                 switch size {
                 case .small:
                     return 156
                 case .none:
                     return .infinity
                 }
             }()

        Button(action: action) {
            Text(title)
                .typographyStyle(styleConfig.typographyStyle)
                .modifier(UnderlineModifier(applyUnderline: brand == .de && variant == .tertiary, color: styleConfig.foregroundColor))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, styleConfig.padding)
        }
        .frame(maxWidth: buttonMaxWidth)
        .background(
            RoundedRectangle(cornerRadius: brand == .de ? cornerRadius.s : cornerRadius.full)
                        .fill(styleConfig.backgroundColor)
                )
        .brandBorderOverlay(
            radiusKey: brand == .de ? .s : .full,
            strokeKey: .regular,
            color: styleConfig.borderColor
        )
        .foregroundColor(styleConfig.foregroundColor)
    }
}



