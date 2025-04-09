import SwiftUI

struct Stepper: View, BrandStyleSupport  {
    let currentStep: Int
    let intermediateSteps: [Int]?
    let labels: [String]
    
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme

    init(currentStep: Int, intermediateSteps: [Int]? = nil,labels: [String]) {
        self.currentStep = currentStep
        self.intermediateSteps = intermediateSteps
        self.labels = labels
    }
    
    private var computedStepCount: Int {
        if let intermediateSteps = intermediateSteps, !intermediateSteps.isEmpty {
            return max(labels.count - 1, 1)
        }
        return labels.count
    }

    var allSteps: [Int] {
        var stepList = [Int]()
       
        for step in 1...computedStepCount {
            stepList.append(step)
            if intermediateSteps?.contains(step) ?? false {
                stepList.append(step + StepConstants.intermediateStepOffset)
            }
        }
        return stepList
    }
    
    private func isStepCompleted(_ step: Int) -> Bool {
        if step < currentStep {
            return true
        }
        if step >= StepConstants.intermediateStepOffset {
            let correspondingStep = step - StepConstants.intermediateStepOffset
            return intermediateSteps?.contains(correspondingStep) ?? false && correspondingStep < currentStep
        }

        return false
    }

    
    var body: some View {
        VStack(spacing: StepConstants.textOffset) {
            HStack(spacing: 0) {
                ForEach(allSteps.indices, id: \.self) { index in
                    VStack(spacing: 0) {
                        ZStack {
                            StepView(
                                stepNumber: allSteps[index],
                                isCompleted: isStepCompleted(allSteps[index]),
                                isIntermediateComplete: (intermediateSteps?.contains(where: { $0 < currentStep }) ?? false),
                                isCurrent: allSteps[index] == currentStep,
                                isIntermediate: allSteps[index] >= StepConstants.intermediateStepOffset
                            )
                            
                            Text(labels[safe: index] ?? "")
                                .typographyStyle(brand == .de ? .p3 : .p1)
                                .foregroundColor(colorToken(brand == .de ? .grayscale900 : .grayscale700))
                                .multilineTextAlignment(.center)
                                .offset(y: StepConstants.textOffset)
                        }
                        
                    }
                    if index < allSteps.count - 1 {
                        StepConnector(
                            isActive: allSteps[index] < currentStep || ((intermediateSteps?.contains(allSteps[index]) ?? false) && allSteps[index] <= currentStep),
                            isDotted: allSteps[index + 1] >= StepConstants.intermediateStepOffset || allSteps[index] >= StepConstants.intermediateStepOffset,
                            isIntermediate: allSteps[index + 1] >= StepConstants.intermediateStepOffset,
                            isIntermediateComplete: (intermediateSteps?.contains(where: { $0 < currentStep }) ?? false)
                        )
                    }
                }
            }
        }
        .padding(.bottom, StepConstants.textOffset)
    }
}

struct StepConstants {
    static let intermediateStepOffset = 100
    static let stepSize: CGFloat = 24
    static let intermediateStepSize: CGFloat = 10
    static let checkmarkSize: CGFloat = 12
    static let textOffset: CGFloat = stepSize * 2
}

