import SwiftUI
struct StepperPage: View {
    @Environment(\.brand) private var brand
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Stepper Demo Page")
                    .typographyStyle(.h1)
                VStack(spacing:120){
                    
                    StepperComponent(
                        currentStep: 2,
                        labels: ["New Address", "Transfer Dates", "Verification"]
                    )
                    StepperComponent(
                        currentStep: 3,
                        labels: ["New Address", "Transfer Dates", "Verification","Submit"]
                    )
                    StepperComponent(
                        currentStep:4,
                        intermediateSteps: [3],
                        labels: ["Select Plan", "About you", "StartDate","Add-ons","Review","Submit","final"] // ✅ "Add-ons" will be used for intermediate
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
