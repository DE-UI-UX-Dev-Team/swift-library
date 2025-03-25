import SwiftUI
struct CrossServeCardPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ScrollView {
            VStack(spacing: brandSpacing.pageLayout.sectionSpacing.xl) {
                Text("CrossServe Card Demo Page")
                    .typographyStyle(.h1)
                VStack(spacing: 8) {
                    Text("CrossServe Card With Link")
                        .typographyStyle(.h4)
                    CrossServeCardWithLink(
                        image: "doorbell",
                        tag: Tag(text: "Included", style: .active(.greenAccessible)),
                        enrollText:"Enrolled on 08/23/2024",
                        title: "Free nights",
                        description: "No energy charge every night from 8 pm to 6 am",
                        link: Link(
                            text: "View details",
                            variant: .text,
                            isInline: false,
                            action: { print("View details") }
                        )
                    )
                }
                VStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                    Text("CrossServe Card With Button")
                        .typographyStyle(.h4)
                    
                    CrossServeCardWithButton(
                        image: "mask",
                        tag: Tag(text: "Included", style: .active(.greenAccessible)),
                        enrollText:"Enrolled on 08/23/2024",
                        title: "Free nights",
                        description: "No energy charge every night from 8 pm to 6 am",
                        button: Button(
                            title: "View Offer",
                            variant: .primary
                        )
                    )
                }
                VStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                    Text("CrossServe Card With Price Footer")
                        .typographyStyle(.h4)
                    
                    CrossServeCardWithPriceFooter(
                        image: "mask",
                        tag: Tag(text: "Included", style: .active(.greenAccessible)),
                        enrollText:"Enrolled on 08/23/2024",
                        title: "Free nights",
                        description: "No energy charge every night from 8 pm to 6 am",
                        link: Link(
                            text: "View details",
                            variant: .text,
                            isInline: false,
                            action: { print("View details") }
                        ),
                        price: CrossServeCardPrice(oldPrice: "$299", newPrice: "Free", subtext: "Installation included", subtextColor: .iconDefaultGreenUI),
                        footerLink: Link(
                            text: "Activate",
                            variant: .text,
                            isInline: false,
                            action: { print("View details") }
                        )
                    )
                }
                
                VStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                    Text("CrossServe Card With Help text Footer")
                        .typographyStyle(.h4)
                    CrossServeCardWithHelpFooter(
                        image: "mask",
                        tag: Tag(text: "Included", style: .active(.greenAccessible)),
                        enrollText:"Enrolled on 08/23/2024",
                        title: "Free nights",
                        description: "No energy charge every night from 8 pm to 6 am",
                        button: Button(
                            title: "View Offer",
                            variant: .primary
                        ),
                        footerHelpText: "Need more help? Talk to an agent 1-XXX-XXX-XXXX"
                    )
                }
                VStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                    Text("CrossServe Card With Image on Right")
                        .typographyStyle(.h4)
                    CrossServeCardWithImageOnRight(
                        image: "mask",
                        tag: Tag(text: "Included", style: .active(.greenAccessible)),
                        enrollText:"Enrolled on 08/23/2024",
                        title: "Schedule free installation",
                        description: "Enjoy hassle-free installation of your smart thermostat and doorbell by Vivint professionals, ensuring optimal performance and security. Please schedule to complete this offer.Enjoy hassle-free installation of your smart thermostat and doorbell by Vivint professionals, ensuring optimal performance and security. Please schedule to complete this offer.",
                        button: Button(
                            title: "Schedule Free Installation",
                            variant: .primary
                        ),
                        footerHelpText: "Need more help? Talk to an agent 1-XXX-XXX-XXXX"
                        
                    )
                    
                    
                    CrossServeCardWithImageOnRight(
                        image: "update",
                        title: "You are eligible to renew your plan",
                        description: "Your current plan is ending soon, and you are eligible to renew now.",
                        button: Button(
                            title: "View available plans",
                            variant: .primary
                        )
                        
                    )
                }
            } .pageMargins()
        }
    }
    
}


struct CrossServeCardView_Previews: PreviewProvider {
    static var previews: some View {
        
            CrossServeCardPage()
        
    }
}
