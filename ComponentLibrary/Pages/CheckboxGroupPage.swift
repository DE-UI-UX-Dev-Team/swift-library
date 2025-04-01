
import SwiftUI

struct CheckboxGroupPage: View , BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand

    var body: some View {
        VStack(spacing: 28){
            Text("Single Checkbox Item")
                .typographyStyle(.h4)
            CheckboxGroup(
                title: "Enrollment",
                items: [
                    "I want to sign up for <plan name> at the eligible service address and ESI ID shown above. I have read, understand and agree to all contract provisions for my new <plan name> as described on this page, including but not limited to pricing details, term length and cancellation fee, and my contract documents, which include Terms of Service, Electricity Facts Label and Your Rights as a Customer. I have been given the opportunity to print and save copies of these documents, and understand that after submitting this plan change request, I will also receive a copy of these contract documents via email. In the case of an invalid email address, contract documents will be mailed."
                ],
                buttonTitle: "Submit",
                buttonAction: {
                    print("Form submitted successfully")
                }
            )
            
            Text("Single Checkbox Group")
                .typographyStyle(.h4)
            CheckboxGroup(
                title: "Before adding, please read and accept the Home Base Essentials terms and conditions",
                items: [
                    "I have read, understood and agree to the Home Base Essentials <termText>",
                    "I have read, understood and agree to the Reliant Degrees of Difference enrollment <termText>"
                ],
                termsText: "terms and conditions",
                termUrl:"https://www.vivint.com/",
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

