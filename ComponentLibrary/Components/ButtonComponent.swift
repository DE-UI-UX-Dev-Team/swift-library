import SwiftUI

enum ButtonVariant: CaseIterable {
    case primary, secondary, tertiary, disabled
}

enum ButtonSize {
    case `default`, small
}


struct AnyShape: Shape {
    private let pathClosure: @Sendable (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        self.pathClosure = { @Sendable rect in shape.path(in: rect) }
    }

    func path(in rect: CGRect) -> Path {
        pathClosure(rect)
    }
}

struct ButtonStyleConfig {
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color
    let shape: AnyShape
    let typographyStyle: MyTextStyle
    let padding: CGFloat

    static func get(for brand: Brand, variant: ButtonVariant, colorScheme: ColorScheme) -> ButtonStyleConfig {
        let style = brandStyles[brand] ?? defaultBrandStyle

        return ButtonStyleConfig(
            backgroundColor: style.getColor(for: variant, type: .background,brand: brand, colorScheme: colorScheme),
            foregroundColor: style.getColor(for: variant, type: .foreground, brand: brand,colorScheme: colorScheme),
            borderColor: style.getColor(for: variant, type: .border,brand: brand, colorScheme: colorScheme),
            shape: style.shape,
            typographyStyle: .primaryButton,
            padding: style.padding
        )
    }

    enum ColorType {
        case background, foreground, border
    }

    struct BrandStyle {
        let colors: [ButtonVariant: [ColorType: ColorToken]]
        let shape: AnyShape
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
                .tertiary: [.background: .grayscale000, .foreground: .grayscale900, .border: .grayscale000],
                .disabled: [.background: .grayscale300, .foreground: .grayscale600, .border: .grayscale300]
            ],
            shape: AnyShape(RoundedRectangle(cornerRadius: 4)),
            padding: 16
        ),
        .reliant: BrandStyle(
            colors: [
                .primary: [.background: .primaryBase, .foreground: .grayscale000, .border: .primaryBase],
                .secondary: [.background: .primaryLightest, .foreground: .primaryBase, .border: .primaryLightest],
                .tertiary: [.background: .grayscale000, .foreground: .primaryBase, .border: .primaryBase],
                .disabled: [.background: .grayscale400, .foreground: .grayscale600, .border: .grayscale300]
            ],
            shape: AnyShape(Capsule()),
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
        shape: AnyShape(RoundedRectangle(cornerRadius: 8)),
        padding: 14
    )
}

struct ButtonComponent: View {
    @Environment(\.colorScheme) var colorScheme

    let selectedBrand: Brand
    let title: String
    let variant: ButtonVariant
    let size: ButtonSize
    let action: () -> Void

    init(
        selectedBrand: Brand,
        title: String,
        variant: ButtonVariant = .primary,
        size: ButtonSize = .default,
        action: @escaping () -> Void = {}
    ) {
        self.selectedBrand = selectedBrand
        self.title = title
        self.variant = variant
        self.size = size
        self.action = action
    }

    var body: some View {
        let styleConfig = ButtonStyleConfig.get(for: selectedBrand, variant: variant, colorScheme: colorScheme)

        Button(action: action) {
            Text(title)
                .typographyStyle(styleConfig.typographyStyle, brand: selectedBrand)
                .modifier(UnderlineModifier(applyUnderline: selectedBrand == .de && variant == .tertiary, color: styleConfig.foregroundColor))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, styleConfig.padding)
        }
        .frame(maxWidth: size == .default ? .infinity : 156)
        .background(styleConfig.shape.fill(styleConfig.backgroundColor))
        .brandBorderOverlay(
            brand: selectedBrand,
            radiusKey: selectedBrand == .de ? .s : .full,
            strokeKey: .regular,
            color: styleConfig.borderColor
        )
        .foregroundColor(styleConfig.foregroundColor)
    }
}



