import SwiftUI
struct IconsPage: View {
    @Environment(\.brand) private var brand
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Text("Icons Demo Page")
                    .typographyStyle(.h1)
                
                
                VStack(spacing: 20) {
                    Text("Utility Icons")
                        .typographyStyle(.h3)
                    HStack(spacing: 20){
                        Icon(
                            iconName: "month",
                            type: .utility,
                            size: .large,
                            color: .secondaryBase
                        )
                        
                        Icon(
                            iconName: "clock",
                            type: .utility,
                            size: .medium,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "bell-regular-utility",
                            type: .utility,
                            size: .large,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "arrow-right-regular-utility",
                            type: .utility,
                            size: .small,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "arrow-left-regular-utility",
                            type: .utility,
                            size: .medium,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "arrow-up-regular-utility",
                            type: .utility,
                            size: .large,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "arrow-down-regular-utility",
                            type: .utility,
                            size: .large,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "circle-check-sharp-regular-utility",
                            type: .utility,
                            size: .large,
                            color: .grayscale900
                        )
                        
                        Icon(
                            iconName: "home",
                            type: .utility,
                            size: .small,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "bill",
                            type: .utility,
                            size: .medium,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "account",
                            type: .utility,
                            size: .large,
                            color: .grayscale900
                        )
                        Icon(
                            iconName: "discover",
                            type: .utility,
                            size: .large,
                            color: .grayscale900
                        )
                    }
                }
                VStack(spacing: 10) {
                    Text("Illustrative Icons")
                        .typographyStyle(.h3)
                    HStack(spacing: 15){
                        Icon(
                            iconName: "icon-ac-heat-sales-illustrative",
                            type: .illustrative,
                            size: .small,
                            color: .iconDefaultPrimary
                        )
                        Icon(
                            iconName: "icon-ac-heat-protect-illustrative",
                            type: .illustrative,
                            size: .medium,
                            color: .iconDefaultSecondary
                        )
                        Icon(
                            iconName: "icon-account-illustrative",
                            type: .illustrative,
                            size: .large,
                            color: .iconFeedbackError
                        )
                        Icon(
                            iconName: "derocket",
                            type: .illustrative,
                            size: .xLarge,
                            color: .iconDefaultPrimary
                        )
                    }
                }
                
            }
        }
    }
   
}

struct IconsPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            IconsPage()
        }
    }
}
