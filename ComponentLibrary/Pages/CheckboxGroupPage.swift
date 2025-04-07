
import SwiftUI

struct CheckboxGroupPage: View , BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
 
    let singleItem = [
        CheckboxGroupItem(
            label: "I want to sign up for <plan name> at the eligible service address and ESI ID shown above. I have read, understand and agree to all contract provisions for my new <plan name> as described on this page, including but not limited to pricing details, term length and cancellation fee, and my contract documents, which include Terms of Service, Electricity Facts Label and Your Rights as a Customer. I have been given the opportunity to print and save copies of these documents, and understand that after submitting this plan change request, I will also receive a copy of these contract documents via email. In the case of an invalid email address, contract documents will be mailed.",
            value: "singleOption"
        )
    ]
    
    let groupItems = [
        CheckboxGroupItem(
            label: "I have read, understood and agree to the Home Base Essentials terms and conditions",
            
            inlineLinkLabel: [
                (text: "terms and conditions", url: URL(string: "https://www.vivint.com/")!)
            ],
            value: "groupOption1"
        ),
        CheckboxGroupItem(
            label: "I have read, understood and agree to the Reliant Degrees of Difference enrollment terms and conditions ",
            inlineLinkLabel: [(text: "terms", url: URL(string: "https://example.com")!)],
            value: "groupOption2"
        )
    ]

    var body: some View {
        VStack(spacing: 28){
            
            Text("Single Checkbox Item")
                .typographyStyle(.h3)
            CheckboxGroup(
                title: "Enrollment",
                items: singleItem,
                buttonTitle: "Submit",
                buttonAction: { print("Form submitted successfully") }

            )
            
            Text("Single Checkbox Group")
                .typographyStyle(.h3)
            CheckboxGroup(
                title: "Before adding, please read and accept the Home Base Essentials terms and condition",
                items: groupItems,
                buttonTitle: "Accept",
                buttonAction: { print("Terms Accepted") }
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

