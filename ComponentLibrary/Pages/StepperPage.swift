import SwiftUI
struct StepperPage: View {
    @Environment(\.brand) private var brand
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Stepper Demo Page")
                    .typographyStyle(.h1)
                VStack(spacing:120){
                    
                    Stepper(
                        currentStep: 2,
                        labels: ["New Address", "Transfer Dates", "Verification"]
                    )
                    Stepper(
                        currentStep: 3,
                        labels: ["New Address", "Transfer Dates", "Verification","Submit"]
                    )
                    Stepper(
                        currentStep:4,
                        intermediateSteps: [3],
                        labels: ["Select Plan", "About you", "StartDate","Add-ons","Review","Submit","final"]
                    )
                }
            } .pageMargins()
        }
    }
    
}
struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            StepperPage()
        }
    }
}
