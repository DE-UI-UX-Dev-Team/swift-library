

import SwiftUI

struct HeroPage: View , BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand

    @State private var heroSelectedPlanID: UUID? = nil
    
    private let allHeroPlans: [PlanCard] = [
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
        ),
        PlanCard(
            cardTitle: "FREE FROM 8 P.M. FRIDAY TO 12",
            title: "Reliant Truly Free Weekends 100% Solar",
            subtitle: "Everything is greener in Texas! Enjoy 18 months of electricity at a fixed rate",
            priceRate: PriceRate(price: "17.5", unit: "/kWh"),
            priceDescription:"price at 2000 kWh",
            link: Link(
                text: "Check it out",
                variant: .text,
                isInline: false,
                action: { print("Link clicked for Plan B") }
            ),
            planImage: Image("placeholder"),
            withAutoPay: false,
            isSelected: .constant(false)
        )
    ]
    
    var body: some View {
        ScrollView{
            VStack( spacing:20){
                
                Text("Hero")
                    .typographyStyle(.h3)
                 Hero(
                                    backgroundImage: Image("heroBG1"),
                                    subImage: Image("Hugo"),
                                    titleText: "Hello Mark, thanks for being a Reliant customer",
                                    contentText: "You are eligible to renew your plan now"
                                )
                     
                Text("Hero with card")
                    .typographyStyle(.h3)
                
                Hero(
                    backgroundImage: Image("heroBG3"),
                    hasCard: true
                ){
                    VStack{
                        
                        PlanCardList(selectedPlanID: $heroSelectedPlanID, plans: allHeroPlans)
                    }}
                
                Text("Hero")
                    .typographyStyle(.h3)
                 Hero(
                                    backgroundImage: Image("heroBG1"),
                                    titleText: "Hello Mark, thanks for being a Reliant customer",
                                    contentText: "You are eligible to renew your plan now"
                                )
                

            }
        }}
  
}

struct HeroPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            HeroPage()
        }
    }
}

