import SwiftUI

struct StepperView: View {
    let steps: Int
    let currentStep: Int
    let intermediateSteps: [Int]?
    let labels: [String]
    
    @Environment(\.brand) private var brand
    @Environment(\.colorScheme) var colorScheme

    init(steps: Int, currentStep: Int, intermediateSteps: [Int]? = nil,labels: [String]) {
        self.steps = steps
        self.currentStep = currentStep
        self.intermediateSteps = intermediateSteps
        self.labels = labels
    }

    var allSteps: [Int] {
        var stepList = [Int]()
       
        for step in 1...steps {
            stepList.append(step)
            if intermediateSteps?.contains(step) == true {
                stepList.append(step + 100) // Unique identifier for intermediate step
            }
        }
        return stepList
    }
    
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(allSteps.indices, id: \.self) { index in
                HStack(spacing: 0) {
                    ZStack {
                        StepView(
                            stepNumber: allSteps[index],
                            isCompleted: allSteps[index] < currentStep,
                            isIntermediateComplete: (intermediateSteps?.contains(where: { $0 < currentStep }) ?? false),
                            isCurrent: allSteps[index] == currentStep,
                            isIntermediate: allSteps[index] >= 100
                        )
                       
                        Text(labels[safe: index] ?? "")
                            .typographyStyle(.p3)
                            .foregroundColor(ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme))
                            .multilineTextAlignment(.center)
                            .offset(y: 45)
                    }
                    
                    if index < allSteps.count - 1 {
                        StepConnector(
                            isActive: allSteps[index] < currentStep || ((intermediateSteps?.contains(allSteps[index]) ?? false) && allSteps[index] <= currentStep),
                            isDotted: allSteps[index + 1] >= 100 || allSteps[index] >= 100,
                            isIntermediate: allSteps[index + 1] >= 100,
                            isIntermediateComplete: (intermediateSteps?.contains(where: { $0 < currentStep }) ?? false)
                        )
                    }
                }
            }
        }
    }
}

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
        let colors: [StepState: [ColorType: ColorToken]]

        func getColor(for state: StepState, type: ColorType, brand: Brand, colorScheme: ColorScheme) -> Color {
            return colors[state]?[type]?.color(brand: brand, colorScheme: colorScheme) ?? .clear
        }
    }

    static let brandStyles: [Brand: BrandStyle] = [
        .de: BrandStyle(
            colors: [
                .completed: [
                    .fill: .primaryBase,
                    .stroke: .grayscale900,
                    .checkmark: .grayscale900,
                    .text: .grayscale900,
                    .intermediateFill: .primaryBase,
                    .intermediateStroke: .grayscale900
                ],
                .current: [
                    .fill: .primaryBase,
                    .stroke: .grayscale900,
                    .checkmark: .grayscale900,
                    .text: .grayscale900,
                    .intermediateFill: .grayscale000,
                    .intermediateStroke: .grayscale900
                ],
                .upcoming: [
                    .fill: .grayscale000,
                    .stroke: .grayscale900,
                    .checkmark: .grayscale000,
                    .text: .grayscale900,
                    .intermediateFill: .grayscale000,
                    .intermediateStroke: .grayscale900
                ]
            ]
        ),
        .reliant: BrandStyle(
            colors: [
                .completed: [
                    .fill: .grayscale000,
                    .stroke: .primaryBase,
                    .checkmark: .primaryBase,
                    .text: .grayscale000,
                    .intermediateFill: .grayscale000,
                    .intermediateStroke: .primaryBase
                ],
                .current: [
                    .fill: .primaryBase,
                    .stroke: .primaryBase,
                    .checkmark: .primaryBase,
                    .text: .grayscale000,
                    .intermediateFill: .grayscale000,
                    .intermediateStroke: .primaryBase
                ],
                .upcoming: [
                    .fill: .grayscale000,
                    .stroke: .borderDefaultPrimary,
                    .checkmark: .grayscale000,
                    .text: .borderDefaultPrimary,
                    .intermediateFill: .grayscale000,
                    .intermediateStroke: .borderDefaultPrimary
                ]
            ]
        )
    ]

    static let defaultBrandStyle = BrandStyle(
        colors: [
            .completed: [
                .fill: .primaryBase,
                .stroke: .primaryBase,
                .checkmark: .primaryBase,
                .text: .grayscale000,
                .intermediateFill: .grayscale000,
                .intermediateStroke: .primaryBase
            ],
            .current: [
                .fill: .primaryBase,
                .stroke: .primaryBase,
                .checkmark: .primaryBase,
                .text: .grayscale000,
                .intermediateFill: .grayscale000,
                .intermediateStroke: .primaryBase
            ],
            .upcoming: [
                .fill: .grayscale000,
                .stroke: .borderDefaultPrimary,
                .checkmark: .grayscale000,
                .text: .borderDefaultPrimary,
                .intermediateFill: .grayscale000,
                .intermediateStroke: .borderDefaultPrimary
            ]
        ]
    )
}

enum StepState {
    case completed, current, upcoming
}


struct StepView: View {
    let stepNumber: Int
    let isCompleted: Bool
    let isIntermediateComplete: Bool
    let isCurrent: Bool
    let isIntermediate: Bool

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand

    private var stepState: StepState {
        if isCompleted {
            return .completed
        } else if isCurrent {
            return .current
        } else {
            return .upcoming
        }
    }

    private var style: StepperStyleConfig {
        StepperStyleConfig.get(for: brand, stepState: stepState, colorScheme: colorScheme)
    }

    var body: some View {
        ZStack {
            if isIntermediate {
                Circle()
                    .fill(style.intermediateFillColor)
                    .frame(width: 10, height: 10)
                    .overlay(
                        Circle().stroke(style.intermediateStrokeColor, lineWidth: 4)
                    )
            } else {
                Circle()
                    .fill(style.fillColor)
                    .frame(width: 24, height: 24)
                    .overlay(
                        Circle().stroke(style.strokeColor, lineWidth: 2)
                    )

                if isCompleted {
                    Image(systemName: "checkmark")
                        .foregroundColor(style.checkmarkColor)
                        .font(.system(size: 12, weight: .bold))
                } else {
                    Text("\(stepNumber)")
                        .fontWeight(.bold)
                        .foregroundColor(style.textColor)
                }
            }
        }
    }
}

struct StepConnector: View {
    let isActive: Bool
    let isDotted: Bool
    let isIntermediate: Bool
    let isIntermediateComplete: Bool

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand

    // Computed Property for Connector Color
    private var connectorColor: Color {
        switch brand.rawValue {
        case "de":
            return ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme)
        case "reliant":
            return ((isActive || (isDotted && isIntermediateComplete)) ? ColorToken.primaryBase.color(brand: brand, colorScheme: colorScheme) : ColorToken.borderDefaultPrimary.color(brand: brand, colorScheme: colorScheme))
        default:
            return ColorToken.borderDefaultPrimary.color(brand: brand, colorScheme: colorScheme)
        }
    }

    var body: some View {
        HStack(spacing: 0) {
            if isIntermediate {
                DottedLine()
                    .frame(height: 2)
                    .foregroundColor(connectorColor)
            } else {
                DottedLine(dashed: isDotted)
                    .frame(height: 2)
                    .foregroundColor(connectorColor)
            }
        }
    }
}

struct DottedLine: View {
    var dashed: Bool = true
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height: CGFloat = 2
                path.move(to: CGPoint(x: 0, y: height / 2))
                path.addLine(to: CGPoint(x: width, y: height / 2))
            }
            .stroke(style: StrokeStyle(lineWidth: 2, dash: dashed ? [6,2] : []))
        }
    }
}

// Safe Array Indexing
extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
