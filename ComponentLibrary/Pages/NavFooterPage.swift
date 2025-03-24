
import SwiftUI

struct NavFooterPage: View , BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab = 0

    private let tabItemsDE = [
        NavTab(
            icon: Icon( iconName: "home-de",
            type: .utility,
            size: .medium,
            color: .secondaryBase
        ), title: "Home"),
        NavTab(
            icon: Icon(
            iconName: "usage-de",
            type: .utility,
            size: .medium,
            color: .secondaryBase
        ), title: "Usage"),
        NavTab(
            icon: Icon(
            iconName: "support-de",
            type: .utility,
            size: .medium,
            color: .grayscale600
        ), title: "Support"),
        
        NavTab(
            icon:  Icon(
            iconName: "account-de",
            type: .utility,
            size: .medium,
            color: .grayscale600
        ), title: "Account")
    ]
    
    private let pageMapDE = [
        0: AnyView(LinkPage()),
        1: AnyView(InputPage()),
        2: AnyView(Text("Support Page").typographyStyle(.h2)),
        3: AnyView(Text("Account Page").typographyStyle(.h2))
    ]
    
    private let tabItemsRE = [
        NavTab(
            icon: Icon( iconName: "home",
                              type: .utility,
                              size: .medium,
                              color: .grayscale900
                          ), title: "Home"),
        NavTab(
            icon: Icon(
            iconName: "bill",
            type: .utility,
            size: .medium,
            color: .grayscale900
        ), title: "Bill"),
        NavTab(
            icon:Icon(
            iconName: "usage",
            type: .utility,
            size: .medium,
            color: .grayscale900
        ), title: "Usage"),
        NavTab(
            icon:Icon(
            iconName: "discover",
            type: .utility,
            size: .medium,
            color: .grayscale900
        ), title: "Discover"),
        NavTab(
            icon:  Icon(
            iconName: "account",
            type: .utility,
            size: .medium,
            color: .grayscale900
        ), title: "Account")
    ]
    
    private  let pageMapRE = [
        0: AnyView(PlanCardPage()),
        1: AnyView(ConfirmationPage()),
        2: AnyView(Text("Usage Page").typographyStyle(.h2)),
        3: AnyView(Text("Discover Page").typographyStyle(.h2)),
        4: AnyView(Text("Account Page").typographyStyle(.h2))
    ]
    
    private var tabItems: [NavTab] {
                switch brand {
                case .reliant:
                    return tabItemsRE
                case .de:
                    return tabItemsDE
                }
            }
            
        private var pageMap: [Int: AnyView] {
                switch brand {
                case .reliant:
                    return pageMapRE
                case .de:
                    return pageMapDE
                }
            }

    var body: some View {
        NavFooter(
                selectedTab: $selectedTab,
                NavTabItems: tabItems,
                content: { selectedTab in
                pageMap[selectedTab] ?? AnyView(Text("Unknown Page").typographyStyle(.h2))
                        }
                    )
    }
}

struct NavFooterPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            NavFooterPage()
        }
    }
}

