
import SwiftUI

struct NavFooterConfig {
    let tabItems: [TabItem]
    let pageMap: [Int: AnyView]

    static let deConfig = NavFooterConfig(
        tabItems: [
            TabItem(imageName: "homeDE", title: "Home"),
            TabItem(imageName: "usageDE", title: "Usage"),
            TabItem(imageName: "supportDE", title: "Support"),
            TabItem(imageName: "accountDE", title: "Account")
        ],
        pageMap: [
            0: AnyView(LinkPage()),
            1: AnyView(InputPage()),
            2: AnyView(Text("Support Page").font(.largeTitle).foregroundColor(.black)),
            3: AnyView(Text("Account Page").font(.largeTitle).foregroundColor(.black))
        ]
    )

    static let reliantConfig = NavFooterConfig(
        tabItems: [
            TabItem(imageName: "homeRE", title: "Home"),
            TabItem(imageName: "billRE", title: "Bill"),
            TabItem(imageName: "usageRE", title: "Usage"),
            TabItem(imageName: "discoverRE", title: "Discover"),
            TabItem(imageName: "accountRE", title: "Account")
        ],
        pageMap: [
            0: AnyView(PlanCardPage()),
            1: AnyView(ConfirmationPage()),
            2: AnyView(Text("Usage Page").font(.largeTitle).foregroundColor(.black)),
            3: AnyView(Text("Discover Page").font(.largeTitle).foregroundColor(.black)),
            4: AnyView(Text("Account Page").font(.largeTitle).foregroundColor(.black))
        ]
    )

    static func config(for brand: Brand) -> Self {
        switch brand {
        case .reliant: return .reliantConfig
        case .de: return .deConfig
        }
    }
}

struct NavFooterPage: View {
    @Environment(\.brand) var brand
    @State private var selectedTab = 0

    private var config: NavFooterConfig {
        NavFooterConfig.config(for: brand)
    }

    var body: some View {
        NavFooter(
            selectedTab: $selectedTab,
            tabItems: config.tabItems,
            content: { selectedTab in
                config.pageMap[selectedTab] ?? AnyView(Text("Unknown Page").font(.largeTitle).foregroundColor(.black))
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
