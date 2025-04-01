
import SwiftUI

struct CheckboxGroupPage: View , BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand

    var body: some View {
        VStack(spacing: 20){
            CheckboxGroup(
                title: "Enrollment",
                items: [
                    "I want to sign up for <plan name> at the eligible service address and ESI ID shown above. I have read and understood the terms and conditions, and I agree to them fully without any reservations."
                ],
                buttonTitle: "Submit",
                buttonAction: {
                    print("Form submitted successfully")
                }
            )
            
            
            CheckboxGroup(
                title: "Before adding, please read and accept the Home Base Essentials terms and conditions",
                items: [
                    "I have read,",
                    "I have read, understood and agree to the Reliant Degree of Difference enrollmen"
                ],
                buttonTitle: "Accept",
                buttonAction: {
                    print("Form submitted successfully")
                }
            )
        }
        .pageMargins()
    }
}

struct CheckboxGroupPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
                CheckboxGroupPage()
            }
    }
}

