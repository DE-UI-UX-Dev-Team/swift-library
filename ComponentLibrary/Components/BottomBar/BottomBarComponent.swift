
import SwiftUI

struct BarTab: Identifiable {
    let id = UUID()
    let icon: Icon?
    let title: String
}



struct BottomBar<Content: View>: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab: Int
    @Binding var isBottomBarVisible: Bool
    let content: (Int) -> Content
    
    private var bottomBarconfig: BottomBarConfig {
              BottomBarConfigProvider.configurations[brand] ?? DEBottomBarConfig()
              }
    
    var body: some View {
        VStack(spacing: 0) {
            content(selectedTab)
            Spacer()
            
            if isBottomBarVisible {
                Separator(type: .horizontal)
                HStack(alignment: brand == .de ? .center : .top) {
                    ForEach(Array(bottomBarconfig.tabItems().enumerated()), id: \.1.id) { (index: Int, item: BarTab) in
                        BarTabItem(
                            icon: item.icon,
                            title: item.title,
                            isSelected: selectedTab == index,
                            action: {
                                selectedTab = index
                                isBottomBarVisible = true
                            }
                        )
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity, alignment: brand == .de ? .center : .top)
                .padding(.horizontal, brand == .de ? brandSpacing.containerSpacing.padding.s : brandSpacing.containerSpacing.padding.l)
                .padding(.top, brandSpacing.containerSpacing.padding.s)
                .padding(.bottom, brand == .de ? brandSpacing.containerSpacing.padding.none : brandSpacing.containerSpacing.padding.s)
                .background(brand == .de ? colorToken(.pageFillGrayDefault) : colorToken(.pageFillGray1))
            }
        }
    }
}
