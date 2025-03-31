
import SwiftUI

struct PlanCardPage: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand
    
    private let mimicPlans: [PlanCard] = [
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
                Tag(text: "Recommended", style: .active(.tertiaryBase), iconPosition: .left),
                Tag(text: "$200 Bill Credit", style: .active(.primaryBase)),
                
            ],
            link: Link(
                text: "View plan details",
                variant: .text,
                isInline: false,
                action: { print("View plan details") }
            ),
            planImage: Image("placeholder"),
            withAutoPay: true
        ),
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
            withAutoPay: false
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            PlanCardList(plans: mimicPlans)
        }
        .pageMargins()
    }
}

struct PlanCardPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            PlanCardPage()
        }
    }
}


