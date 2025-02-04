//
//  ButtonComponent.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/4/25.
//

import SwiftUI

// MARK: - Supporting Types

enum ButtonVariant {
    case primary
    case secondary
    case tertiary
    case disabled
}

enum ButtonSize {
    case `default`
    case small
}

// Optional: Using an enum for brand improves type safety:
enum Brand: String {
    case de = "brandDE"
    case reliant = "brandReliant"
}

// A simple type-erased Shape to allow different shapes in one property.
struct AnyShape: Shape {
    // Mark the closure as @Sendable
    private let pathClosure: @Sendable (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        // Annotate the closure as @Sendable when initializing
        self.pathClosure = { @Sendable rect in
            shape.path(in: rect)
        }
    }

    func path(in rect: CGRect) -> Path {
        pathClosure(rect)
    }
}


// MARK: - Unified Button Component

struct ButtonComponent: View {
    @Environment(\.colorScheme) var colorScheme

    let selectedBrand: Brand
    let title: String
    let variant: ButtonVariant
    let size: ButtonSize
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
                .typographyStyle(buttonTypographyStyle, brand: selectedBrand.rawValue)
                // Apply underline for tertiary variant For brandD
                .modifier(UnderlineModifier(applyUnderline: selectedBrand == .de && variant == .tertiary, color: foregroundColor))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, verticalPadding)
        }
        .frame(maxWidth: size == .default ? .infinity : 156)
        .background(
            backgroundShape
                .fill(backgroundColor)
        )
        .brandBorderOverlay(
            brand: selectedBrand.rawValue,
            radiusKey: selectedBrand == .de ? .s : .full,
            strokeKey: .regular,
            color: borderColor
        )
        .foregroundColor(foregroundColor)
    }

    // MARK: - Computed Properties

    private var buttonTypographyStyle: MyTextStyle {
        return .primaryButton
    }

    
    private var verticalPadding: CGFloat {
        // DE uses 16; Reliant uses 15.
        return selectedBrand == .de ? 16 : 15
    }
    
    private var backgroundShape: AnyShape {
        // DE uses a RoundedRectangle; Reliant uses a Capsule.
        if selectedBrand == .de {
            return AnyShape(RoundedRectangle(cornerRadius: 4))
        } else {
            return AnyShape(Capsule())
        }
    }
    
    private var backgroundColor: Color {
        switch selectedBrand {
        case .de:
            switch variant {
            case .primary:
                return ColorToken.containerFillTertiaryBrand.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .secondary:
                return ColorToken.containerFillGrayDefault.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .tertiary:
                return ColorToken.grayscale000.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .disabled:
                return ColorToken.grayscale300.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            }
        case .reliant:
            switch variant {
            case .primary:
                return ColorToken.primaryBase.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .secondary:
                return ColorToken.primaryLightest.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .tertiary:
                return ColorToken.grayscale000.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .disabled:
                return ColorToken.grayscale400.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            }
        }
    }
    
    private var foregroundColor: Color {
        switch selectedBrand {
        case .de:
            switch variant {
            case .primary, .secondary, .tertiary:
                return ColorToken.grayscale900.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .disabled:
                return ColorToken.grayscale600.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            }
        case .reliant:
            switch variant {
            case .primary:
                return ColorToken.grayscale000.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .secondary, .tertiary:
                return ColorToken.primaryBase.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .disabled:
                return ColorToken.grayscale600.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            }
        }
    }
    
    private var borderColor: Color {
        switch selectedBrand {
        case .de:
            switch variant {
            case .primary, .secondary:
                return ColorToken.grayscale900.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .tertiary:
                return .clear
            case .disabled:
                return ColorToken.grayscale300.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            }
        case .reliant:
            switch variant {
            case .primary:
                return ColorToken.primaryBase.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .secondary:
                return ColorToken.primaryLightest.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .tertiary:
                return ColorToken.primaryBase.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            case .disabled:
                return ColorToken.grayscale300.color(brand: selectedBrand.rawValue, colorScheme: colorScheme)
            }
        }
    }
}

// MARK: - Underline Modifier (for brandDE tertiary buttons)

struct UnderlineModifier: ViewModifier {
    let applyUnderline: Bool
    let color: Color

    func body(content: Content) -> some View {
        if applyUnderline {
            content.underline(true, color: color)
        } else {
            content
        }
    }
}
