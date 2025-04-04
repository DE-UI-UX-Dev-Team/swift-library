
import SwiftUI

struct AllPlansPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedPlanID: UUID? = nil
    @State private var showBottomSheet: Bool = false
    
    private let allPlans: [PlanCard] = [
                            PlanCard(
                                cardTitle: "2 FREE DAYS PER WEEK",
                                title: "Reliant Truly Free Nights 100% Solar 12 plan",
                                subtitle: "Straightforward plan with locked-in energy charge ",
                                priceRate: PriceRate(price: "18.5", unit: "/kWh"),
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
                            ),
        PlanCard(
            cardTitle: "FREE FROM 8 P.M. FRIDAY TO 12 A.M. MONDAY",
            title: "susanReliant Truly Free Weekends 100% Solar 12 plan",
            subtitle: "Save on electricity all weekend long",
            priceRate: PriceRate(price: "18.5", unit: "/kWh"),
            priceDescription: "price at 1800 kWh",
            tags: [
                Tag(text: "12 months", style: .inactive),
                Tag(text: "Fixed rate", style: .inactive),
                Tag(text: "100% solar", style: .inactive)
            ],
            link: Link(
                text: "View plan details",
                variant: .text,
                isInline: false,
                action: { print("View plan details for Truly Free Weekends") }
            ),
            isSelected: .constant(false)
        ),
        PlanCard(
            cardTitle: "FIXED RATE",
            title: "Reliant Truly Free Weekends 100% Solar 12 plan",
            subtitle: "Straightforward plan with locked-in energy charge",
            priceRate: PriceRate(price: "15.2", unit: "/kWh"),
            priceDescription: "price at 1800 kWh",
            tags: [
                Tag(text: "24 months", style: .inactive),
                Tag(text: "Fixed rate", style: .inactive),
                Tag(text: "100% solar", style: .inactive)
            ],
            link: Link(
                text: "View plan details",
                variant: .text,
                isInline: false,
                action: { print("View plan details for Fixed Rate") }
            ),
            isSelected: .constant(false)
        )
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing:brandSpacing.pageLayout.sectionSpacing.l) {
                Hero(
                    backgroundImage: Image("heroBG1"),
                    subImage: Image("Hugo"),
                    titleText: "Hello Mark, thanks for being a Reliant customer",
                    contentText: "You are eligible to renew your plan now"
                )
                VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.l) {

                                Stepper(
                                                currentStep: 1,
                                                labels: ["Select plan", "Free Offer", "Review and submit"]
                                      )
                    
                    
                            VStack(alignment: .leading, spacing: 8){
                                            Text("Recommended plan for:")
                                                .typographyStyle(brand == .de ? .h6 : .h4)
                                            Text("1234 Address Dr.\nHouston, TX 77001")
                                                .typographyStyle(brand == .de ? .p3 : .p1)
                    
                                        }
                    PlanCardList(selectedPlanID: $selectedPlanID, plans: allPlans)
                        .onChange(of: selectedPlanID) {
                            showBottomSheet = selectedPlanID != nil
                        }
                }
                 .padding(.horizontal, brandSpacing.containerSpacing.padding.m)
                .padding(.bottom, brandSpacing.containerSpacing.padding.m)
            }
        }
        .sheet(isPresented: $showBottomSheet) {
            if let selectedID = selectedPlanID,
               let selectedPlan = allPlans.first(where: { $0.id == selectedID }) {
                BottomSheetView(
                    title: selectedPlan.title,
                    priceRate: selectedPlan.priceRate,
                    priceDescription:selectedPlan.priceDescription,
                    onCancel: {
                        selectedPlanID = nil
                          showBottomSheet = false
                                        }
                )
                 .presentationDetents([.fraction(0.25)])

            }
        }
    }
}


struct BottomSheetView: View , BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    let title: String
    let priceRate: PriceRate
    let priceDescription: String
    let onCancel: () -> Void
    
    var body: some View {
        VStack(spacing: brandSpacing.pageLayout.sectionSpacing.m) {
       
            HStack(alignment: .center){
                    Text("Your selected plan:")
                    .typographyStyle(brand == .de ?.p2:.p1)
                    .foregroundColor(colorToken(.grayscale700))
                  Spacer()
                    Link(
                        text: "Cancel selection",
                        variant: .text,
                        isInline: false,
                        action: {
                            onCancel()
                        }
                    )
                    
                  
                }
           
                
            HStack(alignment: .top) {
                    Text(title)
                        .typographyStyle(.h6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                
                    VStack(alignment: .trailing) {
                        priceRate
                        Text(priceDescription)
                            .typographyStyle(brand == .de ? .p3 : .p2)
                            .foregroundColor(colorToken(.grayscale700))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
     
            
            Button(
                title: "Next",
                variant: .primary
            ) {
                print("Secondary tapped")
            }
            .padding(.bottom,  brandSpacing.containerSpacing.padding.m)
        }
        .padding(.horizontal,  brandSpacing.containerSpacing.padding.m)
        .padding(.top,  brandSpacing.containerSpacing.padding.m)
    }
}

struct AllPlansPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            AllPlansPage()
        }
    }
}
