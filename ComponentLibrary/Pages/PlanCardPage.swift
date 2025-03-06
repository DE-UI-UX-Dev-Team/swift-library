
import SwiftUI

struct PlanCardPage: View {
    var body: some View {
        VStack(spacing: 0) {
  
                VStack(spacing: 20) {
                    
                    PlanCardComponent(
                        cardTitle: "2 FREE DAYS PER WEEK",
                        title: "Reliant Truly Free Nights 100% Solar 12 plan",
                        subtitle: "Straightforward plan with locked-in energy charge",
                        price: "18.5¢/kWh",
                        priceDescription: "price at 2,000 kWh",
                        tags: [
                            TagConfig(text: "12 months", style: .inactive),
                            TagConfig(text: "Fixed rate", style: .inactive),
                            TagConfig(text: "100% solar", style: .inactive)
                        ],
                        promotionalTags: [
                            TagConfig(text: "Recommended", style: .active(.tertiaryBase), iconPosition: .left),
                            TagConfig(text: "$200 Bill Credit", style: .active(.primaryBase))
                        ],
                        linkConfig: LinkConfig(
                            text: "View plan details",
                            variant: .text,
                            isInline: false,
                            action: {
                                print("View plan details")
                            }
                        ),
                        variant: .selected
                    )
                    
                    

                    PlanCardComponent(
                        cardTitle: "FREE FROM 8 P.M. FRIDAY TO 12 A.M. MONDAY",
                        title: "Reliant Truly Free Weekends 100% Solar 12 plan",
                        subtitle: "Save on electricity all weekend long",
                        price: "16.8¢/kWh",
                        priceDescription: "price at 1,800 kWh",
                        tags: [
                            TagConfig(text: "12 months", style: .inactive),
                            TagConfig(text: "Fixed rate", style: .inactive),
                            TagConfig(text: "100% solar", style: .inactive)
                        ],
                        linkConfig: LinkConfig(
                            text: "Check it out",
                            variant: .text,
                            isInline: false,
                            action: {
                                print("Link clicked for Plan B")
                            }
                        ),
                        variant: .unselected
                    )
                }
           
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


