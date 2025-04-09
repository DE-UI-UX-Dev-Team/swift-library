import SwiftUI
struct TabsPage: View , BrandStyleSupport {
    @State private var selectedTab1 = 0
    @State private var selectedTab2 = 0
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    let topTabs = [
        TabItem(title: "Overview", icon: "month"),
        TabItem(title: "Stats", icon: "month"),
        TabItem(title: "Settings", icon: "month")
    ]

    let bottomTabs = [
        TabItem(title: "Account"),
        TabItem(title: "New Contract"),
        TabItem(title: "New Plan"),
        TabItem(title: "Documents")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.threeXL) {
                VStack(alignment: .leading) {
                    
                    TabsComponent(tabItems: topTabs, selectedTab: $selectedTab1)
                    
                    if selectedTab1 == 0 {
                        Text("Overview Content")
                        
                    } else if selectedTab1 == 1 {
                        Text("Stats Content")
                        
                    } else if selectedTab1 == 2 {
                        Text("Settings Content")
                        
                    }
                }
                VStack(alignment: .leading) {
                    
                    TabsComponent(tabItems: bottomTabs, selectedTab: $selectedTab2)
                    
                    if selectedTab2 == 0 {
                        InfoSection(
                            items: [
                                InfoItemModel(title: "Account name", value: "Firstname Lastname"),
                                InfoItemModel(title: "Account number", value: "1234567-1"),
                                InfoItemModel(title: "Service address", value: "1234 ADDRESS DR\nHOUSTON, TX 77002"),
                                InfoItemModel(title: "ESID", value: "1033492939819382908")
                            ]
                        )
                    } else if selectedTab2 == 1 {
                        InfoSection(
                            heading: "Contract information",
                            items: [
                                InfoItemModel(title: "Contract term", value: "24 months"),
                                InfoItemModel(title: "Contract begins", value: "On the meter read after 01/01/2023"),
                                InfoItemModel(title: "Contract ends", value: "On the meter read after the 14th month of service"),
                                InfoItemModel(title: "Early cancellation fee", value: "$295.00")
                            ]
                        )
                    } else if selectedTab2 == 2 {
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
                    } else if selectedTab2 == 3{
                        CardWithButton(
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
                }
            }
            .padding()
        }
    }
}
struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            TabsPage()
        }
    }
}

