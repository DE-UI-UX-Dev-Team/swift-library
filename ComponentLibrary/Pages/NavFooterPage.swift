
import SwiftUI

struct NavFooterPage: View {
    @Environment(\.brand) var brand
    @State private var selectedTab = 0

    private let tabItemsDE = [
            TabItem(imageName: "homeDE", title: "Home"),
            TabItem(imageName: "usageDE", title: "Usage"),
            TabItem(imageName: "supportDE", title: "Support"),
            TabItem(imageName: "accountDE", title: "Account")
        ]
        
        private let tabItemsRE = [
            TabItem(imageName: "homeRE", title: "Home"),
            TabItem(imageName: "billRE", title: "Bill"),
            TabItem(imageName: "usageRE", title: "Usage"),
            TabItem(imageName: "discoverRE", title: "Discover"),
            TabItem(imageName: "accountRE", title: "Account")
        ]

    private let pageMapDE: [Int: AnyView] = [
            0: AnyView(LinkPage()),
            1: AnyView(InputPage()),
            2: AnyView(Text("Support Page").font(.largeTitle).foregroundColor(.black)),
            3: AnyView(Text("Account Page").font(.largeTitle).foregroundColor(.black)),
        ]
    
    private let pageMapRE: [Int: AnyView] = [
        0: AnyView(PlanCardPage()),
        1: AnyView(ConfirmationPage()),
        2: AnyView(Text("Usage Page").font(.largeTitle).foregroundColor(.black)),
        3: AnyView(Text("Discover Page").font(.largeTitle).foregroundColor(.black)),
        4: AnyView(Text("Account Page").font(.largeTitle).foregroundColor(.black))
    ]

    
    
    private var tabItems: [TabItem] {
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
                tabItems: tabItems,
                content: { selectedTab in
                    pageMap[selectedTab] ?? AnyView(Text("Unknown Page").font(.largeTitle).foregroundColor(.black))
                }
            )
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }

struct NavFooterPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            NavFooterPage()
        }
    }
}
