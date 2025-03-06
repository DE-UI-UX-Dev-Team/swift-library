import SwiftUI

struct StepperStyleConfig {
    let fillColor: Color
    let strokeColor: Color
    let checkmarkColor: Color
    let textColor: Color
    let intermediateFillColor: Color
    let intermediateStrokeColor: Color
    
    static func get(for brand: Brand, stepState: StepState, colorScheme: ColorScheme) -> StepperStyleConfig {
        let style = brandStyles[brand] ?? defaultBrandStyle

        return StepperStyleConfig(
            fillColor: style.getColor(for: stepState, type: .fill, brand: brand, colorScheme: colorScheme),
            strokeColor: style.getColor(for: stepState, type: .stroke, brand: brand, colorScheme: colorScheme),
            checkmarkColor: style.getColor(for: stepState, type: .checkmark, brand: brand, colorScheme: colorScheme),
            textColor: style.getColor(for: stepState, type: .text, brand: brand, colorScheme: colorScheme),
            intermediateFillColor: style.getColor(for: stepState, type: .intermediateFill, brand: brand, colorScheme: colorScheme),
            intermediateStrokeColor: style.getColor(for: stepState, type: .intermediateStroke, brand: brand, colorScheme: colorScheme)
        )
    }

    enum ColorType {
        case fill, stroke, checkmark, text, intermediateFill, intermediateStroke
    }

    struct BrandStyle {
        let colors: [StepState: StepperColors]
        
        func getColor(for state: StepState, type: ColorType, brand: Brand, colorScheme: ColorScheme) -> Color {
            let colorSet = colors[state] ?? StepperColors.defaultColors
            return colorSet.getColor(for: type, brand: brand, colorScheme: colorScheme)
        }
    }
    
    struct StepperColors {
        let fill: ColorToken
        let stroke: ColorToken
        let checkmark: ColorToken
        let text: ColorToken
        let intermediateFill: ColorToken
        let intermediateStroke: ColorToken

        func getColor(for type: ColorType, brand: Brand, colorScheme: ColorScheme) -> Color {
            switch type {
            case .fill: return fill.color(brand: brand, colorScheme: colorScheme)
            case .stroke: return stroke.color(brand: brand, colorScheme: colorScheme)
            case .checkmark: return checkmark.color(brand: brand, colorScheme: colorScheme)
            case .text: return text.color(brand: brand, colorScheme: colorScheme)
            case .intermediateFill: return intermediateFill.color(brand: brand, colorScheme: colorScheme)
            case .intermediateStroke: return intermediateStroke.color(brand: brand, colorScheme: colorScheme)
            }
        }

        static let defaultColors = StepperColors(
            fill: .primaryBase, stroke: .primaryBase, checkmark: .primaryBase, text: .grayscale000,
            intermediateFill: .grayscale000, intermediateStroke: .primaryBase
        )
    }

    private static func createBrandStyle(fill: ColorToken, stroke: ColorToken, checkmark: ColorToken, text: ColorToken, intermediateFill: ColorToken, intermediateStroke: ColorToken) -> StepperColors {
        return StepperColors(
            fill: fill,
            stroke: stroke,
            checkmark: checkmark,
            text: text,
            intermediateFill: intermediateFill,
            intermediateStroke: intermediateStroke
        )
    }

    static let brandStyles: [Brand: BrandStyle] = [
        .de: BrandStyle(colors: [
            .completed: createBrandStyle(fill: .primaryBase, stroke: .grayscale900, checkmark: .grayscale900, text: .grayscale900, intermediateFill: .primaryBase, intermediateStroke: .grayscale900),
            .current: createBrandStyle(fill: .primaryBase, stroke: .grayscale900, checkmark: .grayscale900, text: .grayscale900, intermediateFill: .grayscale000, intermediateStroke: .grayscale900),
            .upcoming: createBrandStyle(fill: .grayscale000, stroke: .grayscale900, checkmark: .grayscale000, text: .grayscale900, intermediateFill: .grayscale000, intermediateStroke: .grayscale900)
        ]),
        .reliant: BrandStyle(colors: [
            .completed: createBrandStyle(fill: .grayscale000, stroke: .primaryBase, checkmark: .primaryBase, text: .grayscale000, intermediateFill: .grayscale000, intermediateStroke: .primaryBase),
            .current: createBrandStyle(fill: .primaryBase, stroke: .primaryBase, checkmark: .primaryBase, text: .grayscale000, intermediateFill: .grayscale000, intermediateStroke: .primaryBase),
            .upcoming: createBrandStyle(fill: .grayscale000, stroke: .borderDefaultSecondary, checkmark: .grayscale000, text: .borderDefaultSecondary, intermediateFill: .grayscale000, intermediateStroke: .borderDefaultSecondary)
        ])
    ]

    static let defaultBrandStyle = BrandStyle(colors: [
        .completed: createBrandStyle(fill: .primaryBase, stroke: .primaryBase, checkmark: .primaryBase, text: .grayscale000, intermediateFill: .grayscale000, intermediateStroke: .primaryBase),
        .current: createBrandStyle(fill: .primaryBase, stroke: .primaryBase, checkmark: .primaryBase, text: .grayscale000, intermediateFill: .grayscale000, intermediateStroke: .primaryBase),
        .upcoming: createBrandStyle(fill: .grayscale000, stroke: .borderDefaultPrimary, checkmark: .grayscale000, text: .borderDefaultPrimary, intermediateFill: .grayscale000, intermediateStroke: .borderDefaultPrimary)
    ])
}

enum StepState {
    case completed, current, upcoming
}

