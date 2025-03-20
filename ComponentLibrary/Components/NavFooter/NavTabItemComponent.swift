import SwiftUI


struct NavTabItem: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    let icon: Icon?
    let title: String
    let isSelected: Bool
    let action: () -> Void
  

    var body: some View {
        SwiftUI.Button(action: action) {
            VStack(spacing: brand == .de ? brandSpacing.containerSpacing.gaps.s:brandSpacing.containerSpacing.gaps.xs) {
                if let icon = icon {
                                    Icon(
                                        iconName: icon.iconName,
                                        type: icon.type,
                                        size: icon.size,
                                        color: isSelected ? (brand == .de ? .grayscale700 : .primaryBase) :
                                            (brand == .de ? .grayscale600 : .grayscale700)
                                    )
                                }
                Text(title)
                    .typographyStyle( brand == .de ?.p4 :.p1)
                    .foregroundColor(
                        isSelected ?
                        (brand == .de ? .black : colorToken(.primaryBase)) :
                            (brand == .de ? colorToken(.grayscale600) : colorToken(.grayscale700))
                    )
            }
            .padding( brand == .de ? brandSpacing.containerSpacing.padding.s : 0)
            .background( isSelected ?
                          (brand == .de ?  colorToken(.containerFillPrimary1) :  colorToken(.containerFillGray1)) :
                            (brand == .de ? colorToken(.pageFillGrayDefault) : colorToken(.containerFillGray1))
            )
            .cornerRadius((isSelected && brand == .de) ? cornerRadius.m : 0)
 
        }
        .buttonStyle(PlainButtonStyle())
    }
}
