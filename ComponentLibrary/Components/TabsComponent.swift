import SwiftUI

struct TabItem {
    let title: String
    let icon: String?

    init(title: String, icon: String? = nil) {
        self.title = title
        self.icon = icon
    }
}

struct TabsComponent: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme

    let tabItems: [TabItem]
    @Binding var selectedTab: Int
    var onSelect: ((Int) -> Void)? = nil

    @State private var tabWidth: CGFloat = 0

    var body: some View {
        VStack(spacing: brandSpacing.containerSpacing.gaps.xs) {
            HStack {
                ForEach(tabItems.indices, id: \.self) { index in
                    VStack(spacing: brand == .de ? brandSpacing.containerSpacing.gaps.m : brandSpacing.containerSpacing.gaps.s) {
                        if let icon = tabItems[index].icon {
                            Icon(
                                iconName: icon,
                                type: .utility,
                                size: .medium,
                                color: selectedTab == index
                                    ? (brand == .de ? .grayscale900 : .primaryBase)
                                    : (brand == .de ? .grayscale900 : .grayscale700)
                            )
                        }

                        Text(tabItems[index].title)
                            .typographyStyle(brand == .de ? .p3 : .p1)
                            .foregroundColor(
                                selectedTab == index
                                    ? colorToken(brand == .de ? .grayscale900 : .primaryBase)
                                    : colorToken(brand == .de ? .grayscale900 : .grayscale700)
                            )
                            .fontWeight(selectedTab == index ? .bold : brand == .de ? .bold : .regular)
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = index
                            onSelect?(index)
                        }
                    }
                }
            }

            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(colorToken(brand == .de ? .borderDefaultPrimary : .borderDefaultSecondary))

                Rectangle()
                    .frame(width: tabWidth, height: brand == .de ? 6 : 2)
                    .foregroundColor(colorToken(.primaryBase))
                    .offset(x: CGFloat(selectedTab) * tabWidth, y: -1)
                    .animation(.easeInOut(duration: 0.3), value: selectedTab)
            }
            .frame(height: brandSpacing.pageLayout.sectionSpacing.l)
            .overlay(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            tabWidth = geometry.size.width / CGFloat(tabItems.count)
                        }
                }
            )
        }
    }
}
