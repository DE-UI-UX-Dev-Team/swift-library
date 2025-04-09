
import SwiftUI

struct ChangePlanPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing:brandSpacing.pageLayout.sectionSpacing.l) {
                VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.l) {
                    
                    Stepper(
                        currentStep: 2,
                        labels: ["Select plan", "Free Offer", "Review and submit"]
                    )
                    
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Recommended plan for:")
                            .typographyStyle(brand == .de ? .h6 : .h4)
                        Text("1234 Address Dr.\nHouston, TX 77001")
                            .typographyStyle(brand == .de ? .p3 : .p1)
                        
                    }
                    
                    CardWithPriceFooter(
                        image: "doorbell",
                        tag: Tag(text: "Free", style: .active(.tertiaryBase)),
                        enrollText:"Enrolled on 08/23/2024",
                        title: "Home Base Essentials bundle",
                        description: "Get a Vivint Smart Thermostat,  Doorbell Camera Pro and installation for FREE!",
                        link: Link(
                            text: "View details",
                            variant: .text,
                            isInline: false,
                            action: { print("View details") }
                        ),
                        price: CardPrice(oldPrice: "$299", newPrice: "Free", subtext: "Installation included", subtextColor: .iconDefaultGreenUI),
                        footerLink: Link(
                            text: "Activate",
                            variant: .text,
                            isInline: false,
                            action: { print("View details") }
                        )
                    )
                    
                    CardWithPriceFooter(
                        image: "mask",
                        title: "AC/Heat Protect",
                        description: "Keep cool summer – get protected against costly AC repairs",
                        link: Link(
                            text: "View details",
                            variant: .text,
                            isInline: false,
                            action: { print("View details") }
                        ),
                        price: CardPrice( newPrice: "$8.99/month", subtextColor: .iconDefaultGreenUI),
                        footerLink: Link(
                            text: "Activate",
                            variant: .text,
                            isInline: false,
                            action: { print("View details") }
                        )
                    )
                    

                    
                }
                .padding(.horizontal, brandSpacing.containerSpacing.padding.m)
                .padding(.bottom, brandSpacing.containerSpacing.padding.m)
            }
        }
    }
}


struct ChangePlanPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            ChangePlanPage()
        }
        
    }
}
