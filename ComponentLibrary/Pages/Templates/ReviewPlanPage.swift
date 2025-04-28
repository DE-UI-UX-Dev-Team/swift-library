
import SwiftUI


struct ReviewPlanPage: View, BrandStyleSupport {
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
    
    init() {
            _recommendedPlanID = State(initialValue: recommendedPlans.first?.id)
        }
    

    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    VStack(alignment: .leading, spacing: 24){
                        
                        Stepper(
                            currentStep: 3,
                            labels: ["Select plan", "Free Offer", "Review and submit"]
                        )
                        

                        InfoSection(
                            heading: "Electricity account information",
                            items: [
                                InfoItemModel(title: "Service address", value: "1234 ADDRESS AVE\nHOUSTON, TX 77001"),
                                InfoItemModel(title: "ESID", value: "1033492939819382908")
                            ]
                        )
                    
                        Separator( type: .horizontal)

                        InfoSection(
                            heading: "Contract information",
                            items: [
                                InfoItemModel(title: "Contract term", value: "24 months"),
                                InfoItemModel(title: "Contract begins", value: "On the meter read after 01/01/2023"),
                                InfoItemModel(title: "Contract ends", value: "On the meter read after the 14th month of service"),
                                InfoItemModel(title: "Early cancellation fee", value: "$295.00")
                            ]
                        )
                        
                        Separator( type: .horizontal)
                        
                        ListView(title: "Documents", items: listItems1, isInteractive: true)
                        
                        Separator( type: .horizontal)
                        
                        ListView(items: listItems3, isInteractive: true)  .padding(brandSpacing.containerSpacing.padding.m)
                            .background(colorToken(.grayscale000))
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                       
                        Separator( type: .horizontal)
                        
                        Text("New plan")
                            .typographyStyle(brand == .de ? .h6 : .h4)
                        PlanCardList(selectedPlanID: $recommendedPlanID, plans: recommendedPlans)
 
                        Text("Free Offer")
                            .typographyStyle(brand == .de ? .h6 : .h4)
                        CardWithPriceFooter(
                            image: "doorbell",
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
                                text: "Remove",
                                variant: .text,
                                isInline: false,
                                action: { print("View details") }
                            )
                        )
                      

                            }
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.m)

                }

            }
            .navigationTitle("Review plan")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $navigateToChangePlan) {
                ChangePlanPage()
            }
            .overlay(alignment: .bottom) {
                if let selectedID = recommendedPlanID,
                   let selectedPlan = recommendedPlans.first(where: { $0.id == selectedID }) {
                    BottomSticky {
                        ReviewPlanBottomStickyView(
                            title: selectedPlan.title,
                            priceRate: selectedPlan.priceRate,
                            priceDescription: selectedPlan.priceDescription,
                            onCancel: { recommendedPlanID = nil }
                        )
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        }
    }
}
    
struct ReviewPlanBottomStickyView: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    let title: String
    let priceRate: PriceRate
    let priceDescription: String
    let onCancel: () -> Void
    
    let enrollmentCheckboxItem = [
        CheckboxGroupItem(
            label: "I want to sign up for <plan name> at the eligible service address and ESI ID shown above. I have read, understand and agree to all contract provisions for my new <plan name> as described on this page, including but not limited to pricing details, term length and cancellation fee, and my contract documents, which include Terms of Service, Electricity Facts Label and Your Rights as a Customer. I have been given the opportunity to print and save copies of these documents, and understand that after submitting this plan change request, I will also receive a copy of these contract documents via email. In the case of an invalid email address, contract documents will be mailed.",
            value: "singleOption"
        )
    ]
    
    
    
    var body: some View {
        VStack(spacing: brandSpacing.pageLayout.sectionSpacing.m) {
            HStack(alignment: .center) {
                Text("Your selected plan:")
                    .typographyStyle(brand == .de ? .p2 : .p1)
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
         
                CheckboxGroup(
                    title: "Enrollment authorization",
                    items: enrollmentCheckboxItem,
                    buttonTitle: "Submit",
                    buttonAction: { print("Form submitted successfully") }

                )
                .frame(maxWidth: .infinity)
       
        }
    }
}


var listItems1: [ListItem] {
    [
        ListItem(
            leftIcon: Icon(
                iconName: "bill",
                type: .utility,
                size: .medium,
                color: .primaryBase
            ),
            
            text: "Electricty Facts Label",
            textStyle: .link,
           
            rightIcon: Icon(
                iconName: "download",
                type: .utility,
                size: .medium,
                color: .iconFeedbackSuccess
            ),
            action: .downloadPDF(url: URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")!)
        ),
        ListItem(
            leftIcon: Icon(
                iconName: "bill",
                type: .utility,
                size: .medium,
                color: .primaryBase
            ),
            text: "Terms of service",
            textStyle: .link,
            rightIcon: Icon(
                iconName: "download",
                type: .utility,
                size: .medium,
                color: .iconFeedbackSuccess
            ),
            action: .downloadPDF(url: URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")!)
        ),
        ListItem(
            leftIcon: Icon(
                iconName: "bill",
                type: .utility,
                size: .medium,
                color: .primaryBase
            ),
            text: "Customer Rights",
            textStyle: .link,

            rightIcon: Icon(
                iconName: "download",
                type: .utility,
                size: .medium,
                color: .iconFeedbackSuccess
            ),
            action: .downloadPDF(url: URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")!)
        )
    ]
}

var listItems3: [ListItem] {
    [
        ListItem(
            leftIcon: Icon(
                iconName: "difference",
                type: .utility,
                size: .medium,
                color: .tertiaryBase
            ),
            text: "Send copy to username@gmail.com",
            textStyle:.h4,
            rightIcon: Icon(
                iconName: "chevron_right",
                type: .utility,
                size: .medium,
                color: .grayscale900
            ),
            action: .showBottomSheet(sheetContent:
                    AnyView(
                        VStack(alignment: .leading){
                            ListView(title: "Why you should stay with Reliant", items: listItems4, isInteractive: false)
                        }
                    )
                )
        )
    ]
}

var listItems4: [ListItem] {
    [
        ListItem(
            leftIcon: Icon(
                iconName: "circle-check-sharp-regular-utility",
                type: .utility,
                size: .medium,
                color: .iconDefaultGreenUI
            ),
            text: "Lorem ipsum dolor emit",
            textStyle:.p1
        ),
        ListItem(
            leftIcon: Icon(
                iconName: "circle-dollar-regular-utility",
                type: .utility,
                size: .medium,
                color: .primaryBase
            ),
            text: "Gain greater price stability for the length of your term",
            textStyle:.p1
        ),
        ListItem(
            leftIcon: Icon(
                iconName: "circle-plus-regular-utility",
                type: .utility,
                size: .medium,
                color: .iconDefaultTertiary
            ),
            text: "Exclusive offers, helpful tools, and detailed usage tracking",
            textStyle:.p1
        )
       
    ]
}


    struct ReviewPlanPage_Previews: PreviewProvider {
        static var previews: some View {
            PreviewWrapper { brand in
                ReviewPlanPage()
            }
            
        }
    }

