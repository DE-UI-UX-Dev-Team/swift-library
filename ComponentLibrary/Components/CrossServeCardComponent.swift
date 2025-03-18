import SwiftUI



struct CrossServeCard: View {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
    private var brandSpacing: BrandSpacing {
        SpacingTokenManager.shared.spacing(for: brand)
    }
    
    private var cornerRadius: BorderRadius {
        BorderUtilities.cornerRadius(for: brand)
    }
    
    private func colorToken(_ token: ColorToken) -> Color {
        token.color(brand: brand, colorScheme: colorScheme)
    }
    
    var image: String?
    var tag: String?
    var tagColor: ColorToken?
    var brandImage: String?
    var enrollText: String?
    var title: String
    var description: String?
    var link: String?
    var buttonText: String?
    var buttonVariant: ButtonVariant?
    var footerText: String?
    var price: CrossServeCardPrice?
    var footerLink: String?
    var imageOnRight: Bool = false
    var backgroundColor: ColorToken?
    var isSelected: Bool = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                VStack{
                    if imageOnRight {
                        VStack{
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    if let brandImage = brandImage {
                                        Image(brandImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 19)
                                    }
                                    
                                    if let tag = tag, let tagColor = tagColor {
                                        TagView(
                                            text: tag,
                                            style: .active(tagColor)
                                        )
                                    }
                                    
                                    if let enrollText = enrollText {
                                        Text(enrollText)
                                            .typographyStyle(.p2)
                                    }
                                    
                                    if brandImage == nil && tag == nil && enrollText == nil {
                                        CrossServeCardContent
                                    }
                                }
                                Spacer()
                                VStack{
                                    
                                    if let image = image {
                                        Image(image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 64, height: 64)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            if brandImage != nil || tag != nil || enrollText != nil {
                                CrossServeCardContent
                            }
                        }
                    } else {
                        HStack(alignment: .top) {
                            if let image = image {
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 64)
                                    .cornerRadius(10)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                if let tag = tag, let tagColor = tagColor {
                                    TagView(
                                        text: tag,
                                        style: .active(tagColor)
                                    )
                                }
                                
                                if let enrollText = enrollText {
                                    Text(enrollText)
                                        .typographyStyle(.p2)
                                }
                                
                                if let brandImage = brandImage {
                                    Image(brandImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 19)
                                }
                                
                                CrossServeCardContent
                                
                                if let link = link {
                                    LinkComponent(
                                        text: link,
                                        variant: .text,
                                        isInline: false
                                    )
                                }
                            }
                        }
                    }
                    
                    if let buttonText = buttonText, let buttonVariant = buttonVariant {
                        ButtonComponent(
                            title: buttonText,
                            variant: buttonVariant
                        ) {
                            print("Button tapped")
                        }
                    }
                }
                if price != nil || footerText != nil {
                    SeparatorComponent(type: .horizontal)
                        .padding(.vertical, brandSpacing.containerSpacing.padding.s)
                    
                    CrossServeCardFooter
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, brand == .de ? brandSpacing.containerSpacing.padding.l : brandSpacing.containerSpacing.padding.m)
            .padding(.vertical, brandSpacing.containerSpacing.padding.m)
            .background(colorToken(backgroundColor ?? .grayscale000))
            .brandBorderOverlay(
                radiusKey: .l,
                strokeKey: .regular,
                color: isSelected ? colorToken(brand == .de ? .borderDefaultPrimary : .primaryBase) : colorToken(brand == .de ? .borderDefaultSecondary : .borderDefaultTertiary)
            )
              
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .foregroundColor(colorToken(.iconDefaultPrimary))
                    .frame(width: 22, height: 22)
                    .padding()
            }
        }
    }
    
    @ViewBuilder
    private var CrossServeCardContent: some View {
        VStack(alignment: .leading) {
            Text(title)
                .typographyStyle(.h4)
                .fontWeight(.bold)
            
            if let description = description {
                Text(description)
                    .typographyStyle(.p1)
                    .foregroundColor(colorToken(.grayscale700))
            }
        }
    }
    
    @ViewBuilder
    private var CrossServeCardFooter: some View {
        VStack {
            if let price = price, let footerLink = footerLink {
                HStack {
                    price
                    Spacer()
                    LinkComponent(
                        text: footerLink,
                        variant: .text,
                        isInline: false
                    )
                }
            } else if let footerText = footerText {
                VStack {
                    Text(footerText)
                        .typographyStyle(.p1)
                        .frame(maxWidth: .infinity, alignment: .center) // ✅ Centers the text properly
                }
            }
        }
    }
}

struct CrossServeCardPrice: View {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
    private func colorToken(_ token: ColorToken) -> Color {
        token.color(brand: brand, colorScheme: colorScheme)
    }
    
    var oldPrice: String? = nil
    var newPrice: String
    var subtext: String? = nil
    var subtextColor: ColorToken = .grayscale700

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                if let oldPrice = oldPrice {
                    Text(oldPrice)
                        .typographyStyle(.p1)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
                
                Text(newPrice)
                    .typographyStyle(.h4)
            }
            if let subtext = subtext {
                Text(subtext)
                    .typographyStyle(.p2)
                    .foregroundColor(colorToken(subtextColor))
            }
        }
    }
}


