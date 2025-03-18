import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
}

struct TabBarItem: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    let imageName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: brandSpacing.containerSpacing.gaps.xs) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(title)
                    .typographyStyle( brand == .de ?.p4 :.p1)
                    .foregroundColor(
                        isSelected ?
                        (brand == .de ? .black : colorToken(.primaryBase)) :
                            (brand == .de ? colorToken(.grayscale600) : colorToken(.grayscale700))
                    )
            }
            .padding( brand == .de ? 8 : 0)
            .background( isSelected ?
                          (brand == .de ?  colorToken(.containerFillPrimary1) :  colorToken(.containerFillGray1)) :
                            (brand == .de ? colorToken(.pageFillGrayDefault) : colorToken(.containerFillGray1))
            )
            .cornerRadius((isSelected && brand == .de) ? 5 : 0)
 
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct NavFooter<Content: View>: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab: Int
    let tabItems: [TabItem]
    let content: (Int) -> Content
    
    var body: some View {
        VStack(spacing:0) {
            content(selectedTab)
            Spacer()
            SeparatorComponent(type: .horizontal)
            HStack(alignment: brand == .de ?.center : .top) {
                ForEach(Array(tabItems.enumerated()), id: \.element.id) { index, item in
                    TabBarItem(
                        imageName: item.imageName,
                        title: item.title,
                        isSelected: selectedTab == index
                    ) {
                        selectedTab = index
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity, alignment: brand == .de ?.center : .top)
            .padding(.horizontal, brand == .de ? brandSpacing.containerSpacing.padding.s :  brandSpacing.containerSpacing.padding.l)
            .padding(.top, brandSpacing.containerSpacing.padding.s)
            .padding(.bottom, brandSpacing.containerSpacing.padding.xl)
           .background(brand == .de ? colorToken(.pageFillGrayDefault):colorToken(.pageFillGray1))
        }
    }
}
