import SwiftUI
struct StepperPage: View {
    @Environment(\.brand) private var brand
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Text("Stepper Demo Page")
                    .typographyStyle(.h1)
                VStack(spacing:120){
                    
                    StepperView(
                        steps: 3,
                        currentStep: 2,
                        labels: ["New Address", "Transfer Dates", "Verification"]
                    )
                    StepperView(
                        steps: 4,
                        currentStep: 3,
                        labels: ["New Address", "Transfer Dates", "Verification","Submit"]
                    )
                    StepperView(
                        steps: 5,
                        currentStep: 4,
                        intermediateSteps: [3],
                        labels: ["Select Plan", "About you", "StartDate","Add-ons","Review","Submit"] // ✅ "Add-ons" will be used for intermediate
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
