//
//  LinkComponent.swift
//  ComponentLibrary
//
//  Created by  UI/UX Development Team on 2/6/25.
//
import SwiftUI

// MARK: - Link Variants
enum LinkVariant {
    case text
    case accordion(isExpanded: Bool)
}

// MARK: - Link Component
struct LinkComponent: View {
    @Environment(\.colorScheme) private var colorScheme

    let selectedBrand: Brand
    let text: String
    let variant: LinkVariant
    let isInline: Bool
    let action: () -> Void

    init(
        selectedBrand: Brand,
        text: String,
        variant: LinkVariant,
        isInline: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.selectedBrand = selectedBrand
        self.text = text
        self.variant = variant
        self.isInline = isInline
        self.action = action
    }

    var body: some View {
        let style = LinkStyleConfig.get(for: selectedBrand, colorScheme: colorScheme)
        
        // Create a base Text view.
        let baseText = Text(text)
        
        Button(action: action) {
            HStack(spacing: 4) {
                // Use a Group to conditionally apply typographyStyle.
                Group {
                    if isInline {
                        baseText
                    } else {
                        baseText.typographyStyle(style.typographyStyle, brand: selectedBrand)
                    }
                }
                // Apply common modifiers.
                .foregroundColor(style.foregroundColor)
                .modifier(UnderlineModifier(applyUnderline: style.applyUnderline,
                                            color: style.foregroundColor))
                
                // If this is an accordion variant, show the chevron.
                if case let .accordion(isExpanded) = variant {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(style.foregroundColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Link Style Config
struct LinkStyleConfig {
let foregroundColor: Color
let applyUnderline: Bool
let typographyStyle: MyTextStyle

static func get(for brand: Brand, colorScheme: ColorScheme) -> LinkStyleConfig {
    // Use a dictionary instead of a switch case for brand-based styles
    let styles: [Brand: LinkStyleConfig] = [
        .de: LinkStyleConfig(
            foregroundColor: ColorToken.primaryDarkest.color(brand: .de, colorScheme: colorScheme),
            applyUnderline: true,
            typographyStyle: .link
        ),
        .reliant: LinkStyleConfig(
            foregroundColor: ColorToken.primaryBase.color(brand: .reliant, colorScheme: colorScheme),
            applyUnderline: false,
            typographyStyle: .link
        )
    ]
    
    return styles[brand] ?? styles[.de]!
}
}





