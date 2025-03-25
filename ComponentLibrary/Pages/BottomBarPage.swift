
import SwiftUI

protocol BrandConfiguration {
    var tabItems: [BarTab] { get }
    var pageMap: [Int: AnyView] { get }
}


struct DEBrandConfig: BrandConfiguration {
    let tabItems = [
        BarTab(
            icon: Icon(iconName: "home-de",
                      type: .utility,
                      size: .medium,
                      color: .secondaryBase),
            title: "Home"),
        BarTab(
            icon: Icon(iconName: "usage-de",
                      type: .utility,
                      size: .medium,
                      color: .secondaryBase),
            title: "Usage"),
        BarTab(
            icon: Icon(iconName: "support-de",
                      type: .utility,
                      size: .medium,
                      color: .grayscale600),
            title: "Support"),
        BarTab(
            icon: Icon(iconName: "account-de",
                      type: .utility,
                      size: .medium,
                      color: .grayscale600),
            title: "Account")
    ]
    
    let pageMap = [
        0: AnyView(LinkPage()),
        1: AnyView(InputPage()),
        2: AnyView(Text("Support Page").typographyStyle(.h2)),
        3: AnyView(Text("Account Page").typographyStyle(.h2))
    ]
}

struct ReliantBrandConfig: BrandConfiguration {
    let tabItems = [
        BarTab(
            icon: Icon(iconName: "home",
                      type: .utility,
                      size: .medium,
                      color: .grayscale900),
            title: "Home"),
        BarTab(
            icon: Icon(iconName: "bill",
                      type: .utility,
                      size: .medium,
                      color: .grayscale900),
            title: "Bill"),
        BarTab(
            icon: Icon(iconName: "usage",
                      type: .utility,
                      size: .medium,
                      color: .grayscale900),
            title: "Usage"),
        BarTab(
            icon: Icon(iconName: "discover",
                      type: .utility,
                      size: .medium,
                      color: .grayscale900),
            title: "Discover"),
        BarTab(
            icon: Icon(iconName: "account",
                      type: .utility,
                      size: .medium,
                      color: .grayscale900),
            title: "Account")
    ]
    
    let pageMap = [
        0: AnyView(PlanCardPage()),
        1: AnyView(ConfirmationPage()),
        2: AnyView(Text("Usage Page").typographyStyle(.h2)),
        3: AnyView(Text("Discover Page").typographyStyle(.h2)),
        4: AnyView(Text("Account Page").typographyStyle(.h2))
    ]
}


struct BrandConfigProvider {
    static let configurations: [Brand: BrandConfiguration] = [
        .de: DEBrandConfig(),
        .reliant: ReliantBrandConfig()
    ]
    
    static func config(for brand: Brand) -> BrandConfiguration {
        configurations[brand] ?? DEBrandConfig()
    }
}

struct BottomBarPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab = 0
    
    private var brandConfig: BrandConfiguration {
        BrandConfigProvider.config(for: brand)
    }
    
    var body: some View {
        BottomBar(
            selectedTab: $selectedTab,
            BarTabItems: brandConfig.tabItems,
            content: { selectedTab in
                brandConfig.pageMap[selectedTab] ?? AnyView(Text("Unknown Page").typographyStyle(.h2))
            }
        )
    }
}

struct BottomBarPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            BottomBarPage()
        }
    }
}
