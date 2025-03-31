
import SwiftUI

struct CheckboxGroupPage: View , BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand

  

        var body: some View {
            CheckboxGroup(
                        title: "Enrollment",
                        items: [
                            "I want to sign up for <plan name> at the eligible service address and ESI ID shown above. I have read and understood the terms and conditions, and I agree to them fully without any reservations.nderstood and agree to the Reliant Degree of Difference enrollment terms and conditions"
                        ],
                        buttonTitle: "Submit",
                        buttonAction: {
                            print("Form submitted successfully")
                        }
                    )
                    
                    // Example with two checkboxes
                    CheckboxGroup(
                        title: "Before adding, please read and accept the Home Base Essentials terms and conditions ",
                        items: [
                            "I have read, understood and agree to the Home Base Essentials terms and conditions ",
                            "I have read, understood and agree to the "
                        ],
                        buttonTitle: "Accept",
                        buttonAction: {
                            print("Form submitted successfully")
                        }
                    )
            
        }
}

struct CheckboxGroupPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            CheckboxGroupPage()
        }
    }
}

