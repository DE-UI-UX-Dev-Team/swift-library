
import SwiftUI

struct MyPlanPage: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand
    @State private var selectedTab1 = 0
    let planTabs = [
        TabItem(title: "Plan benefits"),
        TabItem(title: "Plan Offers"),
        TabItem(title: "Other services"),
        TabItem(title: "Account")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.l) {
                
                VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.l) {
                    HStack (alignment: .center){
                        InfoSection(
                            heading: "Your electricity plan for",
                            items: [
                                InfoItemModel(value: "1234 ADDRESS AVE\nHOUSTON, TX 77001"),
                            ]
                        )
                        Spacer()
                        Link(
                            text: "Change",
                            variant: .text,
                            isInline: false,
                            action: {
                                print("Standalone link tapped")
                            }
                        )
                        
                    }
                }
                
                VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.l){
                    CardWithImageOnRight(
                        image: "update",
                        title: "You are eligible to renew your plan",
                        description: "Your current plan is ending soon, and you are eligible to renew now.",
                        button: Button(
                            title: "View available plans",
                            variant: .primary
                        ),
                        backgroundColor: .primaryLightest
                        
                    )
                }
                
                VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.l){
                    PlanCard(
                        cardTitle: "2 FREE DAYS PER WEEK",
                        title: "Reliant Truly Free Weekends 100% Solar 12 plan",
                        subtitle: "Everything is greener in Texas! Enjoy 18 months of electricity at a fixed rate ",
                        priceRate: PriceRate(price: "12.5", unit: "/kWh"),
                        priceDescription:"price at 1800 kWh",
                        tags: [
                            Tag(text: "12 months", style: .inactive),
                            Tag(text: "Fixed rate", style: .inactive),
                            Tag(text: "100% solar", style: .inactive)
                        ],
                        promotionalTags: [
                            Tag(text: "Recommended", style: .active(.tertiaryBase)),
                            Tag(text: "$200 Bill Credit", style: .active(.primaryBase)),
                            
                        ],
                        link: Link(
                            text: "View plan details",
                            variant: .text,
                            isInline: false,
                            action: { print("View plan details") }
                        ),
                        planImage: Image("placeholder"),
                        withAutoPay: true,
                        isSelected: .constant(false)
                    )
                }
                
                VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.l) {
                    
                    TabsComponent(tabItems: planTabs, selectedTab: $selectedTab1)
                    
                    if selectedTab1 == 0 {
                        
                        VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.l){
                            InfoSection(
                                heading: "Your Plan benefits at no cost",
                                items: [
                                    InfoItemModel(value: "Make the most out of your plan and sign up for these benefits without any additional cost!"),
                                ]
                            )
                            
                            CardWithoutLink(
                                image: "mask",
                                tag: Tag(text: "Included", style: .active(.greenAccessible)),
                                enrollText:"Enrolled on 08/23/2024",
                                title: "Free nights",
                                description: "No energy charge every night from 8 p.m. to 6 a.m"
                            )
                            CardWithPriceFooter(
                                image: "doorbell",
                                tag: Tag(text: "Included", style: .active(.greenAccessible)),
                               
                                title: "Home Base Essentials",
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
                                tag: Tag(text: "Included", style: .active(.greenAccessible)),
                                title: "Average Billing",
                                description: "Designed to simplify budgeting by averaging electricity costs for predictable bills.",
                                link: Link(
                                    text: "View details",
                                    variant: .text,
                                    isInline: false,
                                    action: { print("View details") }
                                ),
                                price: CardPrice(newPrice: "$240", subtext: "Your estimated average bill for next month", subtextColor: .grayscale700),
                                footerLink: Link(
                                    text: "Activate",
                                    variant: .text,
                                    isInline: false,
                                    action: { print("View details") }
                                )
                            )
                            CardWithPriceFooter(
                                image: "maskRewards",
                                tag: Tag(text: "Included", style: .active(.greenAccessible)),
                                title: "Reliant Rewards",
                                description: "Reliant Rewards lets you earn points to redeem for bill credits, Amazon gift cards, and more.",
                                link: Link(
                                    text: "View details",
                                    variant: .text,
                                    isInline: false,
                                    action: { print("View details") }
                                ),
                                price: CardPrice(newPrice: "0 points", subtext: "as of 01/13/2025", subtextColor: .grayscale700),
                                footerLink: Link(
                                    text: "Activate",
                                    variant: .text,
                                    isInline: false,
                                    action: { print("View details") }
                                )
                            )
                        }
                    } else if selectedTab1 == 1 {
                        InfoSection(
                            heading: "Contract information",
                            items: [
                                InfoItemModel(title: "Contract term", value: "24 months"),
                                InfoItemModel(title: "Contract begins", value: "On the meter read after 01/01/2023"),
                                InfoItemModel(title: "Contract ends", value: "On the meter read after the 14th month of service"),
                                InfoItemModel(title: "Early cancellation fee", value: "$295.00")
                            ]
                        )
                    } else if selectedTab1 == 2 {
                        PlanCard(
                            cardTitle: "FREE FROM 8 P.M. FRIDAY TO 12 A.M. MONDAY",
                            title: "Reliant Truly Free Weekends 100% Solar 12 plan",
                            subtitle: "Everything is greener in Texas! Enjoy 18 months of electricity at a fixed rate",
                            priceRate: PriceRate(price: "17.5", unit: "/kWh"),
                            priceDescription:"price at 2000 kWh",
                            tags: [
                                Tag(text: "12 months", style: .inactive),
                                Tag(text: "Fixed rate", style: .inactive),
                                Tag(text: "100% solar", style: .inactive)
                            ],
                            link: Link(
                                text: "Check it out",
                                variant: .text,
                                isInline: false,
                                action: { print("Link clicked for Plan B") }
                            ),
                            planImage: Image("monitor"),
                            withAutoPay: false,
                            isSelected: .constant(false)
                        )
                    } else if selectedTab1 == 3{
                        CardWithButton(
                            image: "maskRewards",
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
                }
                Separator( type: .horizontal)
                VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.l){
                    
                    Text("Helpful resources for your plan")
                        .typographyStyle(.h4)
                    HStack{
                        Tile(
                            icon: Icon(
                                iconName: "monitoring",
                                type: .utility,
                                size: .medium,
                                color: .iconDefaultGreenUI
                            ),
                            subTitle: "Moving",
                            descText: "Let Reliant help you move to a new locatio",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment,
                            withBorder: true
                        )
                        
                        
                        Tile(
                            icon: Icon(
                                iconName: "paid",
                                type: .utility,
                                size: .medium,
                                color: .primaryBase
                            ),
                            subTitle: "AutoPay",
                            descText: "Never worry about paying your bill on time",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment,
                            withBorder: true
                        )
                        
                        
                    }
                    HStack{
                        Tile(
                            icon: Icon(
                                iconName: "article",
                                type: .utility,
                                size: .medium,
                                color: .tertiaryBase
                            ),
                            tag: Tag(
                                text: "Time to renew",
                                style: .active(.tertiaryBase)
                            ),
                            subTitle: "My plan",
                            descText: "Left until contract ends (estimated)",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment,
                            withBorder: true
                        )
                        
                        
                        Tile(
                            icon: Icon(
                                iconName: "difference",
                                type: .utility,
                                size: .medium,
                                color: .primaryBase
                            ),
                            subTitle: "Average billing",
                            descText: "Sign up now",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment,
                            withBorder: true
                        )
                        
                        
                    }
                }
            }.pageMargins()
           
        }
    }
}
struct MyPlanPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            MyPlanPage()
        }
    }
}
