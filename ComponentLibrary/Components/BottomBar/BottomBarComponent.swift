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
    let BarTabItems: [BarTab]
    let content: (Int) -> Content
    
    var body: some View {
        VStack(spacing:0) {
            content(selectedTab)
            Spacer()
            Separator(type: .horizontal)
            HStack(alignment: brand == .de ?.center : .top) {
                ForEach(Array(BarTabItems.enumerated()), id: \.element.id) { index, item in
                                    BarTabItem(
                                        icon: item.icon,
                                        title: item.title,
                                        isSelected: selectedTab == index,
                                        action: {
                                            selectedTab = index
                                        }
                                    )
                                    .frame(maxWidth: .infinity)
                                }
            }
            .frame(maxWidth: .infinity, alignment: brand == .de ?.center : .top)
            .padding(.horizontal, brand == .de ? brandSpacing.containerSpacing.padding.s :  brandSpacing.containerSpacing.padding.l)
            .padding(.top, brandSpacing.containerSpacing.padding.s)
            .padding(.bottom,brand == .de ? brandSpacing.containerSpacing.padding.none :  brandSpacing.containerSpacing.padding.s)
           .background(brand == .de ? colorToken(.pageFillGrayDefault):colorToken(.pageFillGray1))
        }
    }
}
