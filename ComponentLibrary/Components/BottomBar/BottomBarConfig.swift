import SwiftUI

protocol BottomBarConfig {
    var tabItems: [BarTab] { get }
    var pageMap: [Int: AnyView] { get }
}

struct DEBottomBarConfig: BottomBarConfig {
    let tabItems = [
        BarTab(icon: Icon(iconName: "home-de", type: .utility, size: .medium, color: .secondaryBase), title: "Home"),
        BarTab(icon: Icon(iconName: "usage-de", type: .utility, size: .medium, color: .secondaryBase), title: "Usage"),
        BarTab(icon: Icon(iconName: "support-de", type: .utility, size: .medium, color: .grayscale600), title: "Support"),
        BarTab(icon: Icon(iconName: "account-de", type: .utility, size: .medium, color: .grayscale600), title: "Account")
    ]
    
    let pageMap = [
        0: AnyView(ComponentLibraryHome()),
        1: AnyView(Text("Usage Page").typographyStyle(.h2)),
        2: AnyView(Text("Support Page").typographyStyle(.h2)),
        3: AnyView(AccountPage())
    ]
}

struct ReliantBottomBarConfig: BottomBarConfig {
    let tabItems = [
        BarTab(icon: Icon(iconName: "home", type: .utility, size: .medium, color: .grayscale900), title: "Home"),
        BarTab(icon: Icon(iconName: "bill", type: .utility, size: .medium, color: .grayscale900), title: "Bill"),
        BarTab(icon: Icon(iconName: "usage", type: .utility, size: .medium, color: .grayscale900), title: "Usage"),
        BarTab(icon: Icon(iconName: "discover", type: .utility, size: .medium, color: .grayscale900), title: "Discover"),
        BarTab(icon: Icon(iconName: "account", type: .utility, size: .medium, color: .grayscale900), title: "Account")
    ]
    
    let pageMap = [
        0: AnyView(ComponentLibraryHome()),
        1: AnyView(Text("Bill Page").typographyStyle(.h2)),
        2: AnyView(Text("Usage Page").typographyStyle(.h2)),
        3: AnyView(Text("Discover Page").typographyStyle(.h2)),
        4: AnyView(AccountPage())
    ]
}

struct BottomBarConfigProvider {
    static let configurations: [Brand: BottomBarConfig] = [
        .de: DEBottomBarConfig(),
        .reliant: ReliantBottomBarConfig()
    ]
}

