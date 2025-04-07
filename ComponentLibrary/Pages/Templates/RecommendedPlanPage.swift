
import SwiftUI


struct RecommendedPlanPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    @State private var navigateToChangePlan = false
    @State private var navigateToAllPlans = false
    
    @State private var recommendedPlanID: UUID? = nil
    
    private let recommendedPlans: [PlanCard] = [
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
                                    isSelected: .constant(false)
                                )
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    Hero(
                        backgroundImage: Image("heroBG1"),
                        subImage: Image("Hugo"),
                        titleText: "Hello Mark, thanks for being a Reliant customer",
                        contentText: "You are eligible to renew your plan now"
                    )
                    
                    VStack(alignment: .leading, spacing: 24){
                        VStack(alignment: .leading, spacing: 8){
                            Text("Recommended plan for:")
                                .typographyStyle(brand == .de ? .h6 : .h4)
                            Text("1234 Address Dr.\nHouston, TX 77001")
                                .typographyStyle(brand == .de ? .p3 : .p1)
                                                
                        }
                        
                        PlanCardList(selectedPlanID: $recommendedPlanID, plans: recommendedPlans)
 
                        
                        HStack() {
                            Text("Why you should stay with Reliant?")
                                .font(.title3)
                                .padding(brandSpacing.containerSpacing.padding.l)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                  
                            }
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.m)

                }

            }
            .navigationTitle("Change plan")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $navigateToChangePlan) {
                ChangePlanPage()
            }
            .navigationDestination(isPresented: $navigateToAllPlans) {
                AllPlansPage()
            }
            BottomSticky{
                VStack(alignment: .center, spacing: 16){
                    Button(
                        title: "Continue with this plan",
                        variant: .primary
                    ){
                        navigateToChangePlan = true
                    }
                    .padding(.horizontal, 16)
                    Link(
                        text: "View all plans",
                        variant: .text,
                        isInline: false,
                        action: {
                            navigateToAllPlans = true
                        }
                    )
                .padding(.bottom, 0)
                }
                
            }
        }
    }
}
    

    struct RecommendedPlanPage_Previews: PreviewProvider {
        static var previews: some View {
            PreviewWrapper { brand in
                RecommendedPlanPage()
            }
            
        }
    }

