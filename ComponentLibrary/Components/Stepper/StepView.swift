import SwiftUI

struct StepView: View, BrandStyleSupport {
    let stepNumber: Int
    let isCompleted: Bool
    let isIntermediateComplete: Bool
    let isCurrent: Bool
    let isIntermediate: Bool

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand

    private var stepState: StepState {
        if isCompleted {
            return .completed
        } else if isCurrent {
            return .current
        }
        else {
            return .upcoming
        }
    }

    private var style: StepperStyleConfig {
        StepperStyleConfig.get(for: self, stepState: stepState)
    }

    var body: some View {
        ZStack {
            if isIntermediate {
                Circle()
                    .fill(style.intermediateFillColor)
                    .frame(width: StepConstants.intermediateStepSize, height: StepConstants.intermediateStepSize)
                    .overlay(
                        Circle().stroke(style.intermediateStrokeColor, lineWidth: 4)
                    )
            } else {
                Circle()
                    .fill(style.fillColor)
                    .frame(width: StepConstants.stepSize, height: StepConstants.stepSize)
                    .overlay(
                        Circle().stroke(style.strokeColor, lineWidth: 2)
                    )

                if isCompleted {
                    Image(systemName: "checkmark")
                        .foregroundColor(style.checkmarkColor)
                        .font(.system(size: StepConstants.checkmarkSize, weight: .bold))
                } else {
                    Text("\(stepNumber)")
                        .fontWeight(.bold)
                        .foregroundColor(style.textColor)
                }
            }
        }
    }
}
