import SwiftUI


struct StepperStyleConfig {
    let fillColor: Color
    let strokeColor: Color
    let checkmarkColor: Color
    let textColor: Color
    let intermediateFillColor: Color
    let intermediateStrokeColor: Color
    
    static func get(for context: some BrandStyleSupport, stepState: StepState) -> StepperStyleConfig {
        let style = brandStyles[context.brand] ?? defaultBrandStyle
        let colors = style.colors[stepState] ?? StepperColors.defaultColors
        
        return StepperStyleConfig(
            fillColor: context.colorToken(colors.fill),
            strokeColor: context.colorToken(colors.stroke),
            checkmarkColor: context.colorToken(colors.checkmark),
            textColor: context.colorToken(colors.text),
            intermediateFillColor: context.colorToken(colors.intermediateFill),
            intermediateStrokeColor: context.colorToken(colors.intermediateStroke)
        )
    }

    struct BrandStyle {
        let colors: [StepState: StepperColors]
    }
    
    struct StepperColors {
        let fill: ColorToken
        let stroke: ColorToken
        let checkmark: ColorToken
        let text: ColorToken
        let intermediateFill: ColorToken
        let intermediateStroke: ColorToken

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

