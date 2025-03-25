import SwiftUI

struct CrossServeCardConfig {
    var image: String
    var tag: Tag? = nil
    var brandImage: String? = nil
    var enrollText: String? = nil
    var title: String
    var description: String
    var link: Link? = nil
    var button: Button? = nil
    var buttonVariant: ButtonVariant? = nil
    var footerHelpText: String? = nil
    var price: CrossServeCardPrice? = nil
    var footerLink: Link? = nil
    var imageOnRight: Bool = false
    var backgroundColor: ColorToken? = nil
    var isSelected: Bool = false
}

struct CrossServeCard: View , BrandStyleSupport  {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme

    var config: CrossServeCardConfig
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                VStack{
                    if config.imageOnRight {
                        VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.s) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.s) {
                                    if let brandImage = config.brandImage {
                                        Image(brandImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 19)
                                    }
                                    
                                    if let tag = config.tag{
                                        tag
                                    }
                                    
                                    if let enrollText = config.enrollText {
                                        Text(enrollText)
                                            .typographyStyle(.p2)
                                    }
                                    
                                    if config.brandImage == nil && config.tag == nil && config.enrollText == nil {
                                        CrossServeCardContent
                                    }
                                }
                                Spacer()
                                VStack{
                                    Image(config.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 64, height: 64)
                                        .cornerRadius(cornerRadius.m)
                                    
                                }
                            }
                            if config.brandImage != nil || config.tag != nil || config.enrollText != nil {
                                CrossServeCardContent
                            }
                        }
                    } else {
                        HStack(alignment: .top,spacing: brandSpacing.containerSpacing.padding.m) {
                           
                            Image(config.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 64)
                                .cornerRadius(cornerRadius.m)
                            
                            VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.s) {
                                if let tag = config.tag{
                                    tag
                                }
                                
                                if let enrollText = config.enrollText {
                                    Text(enrollText)
                                        .typographyStyle(.p2)
                                }
                                
                                if let brandImage = config.brandImage {
                                    Image(brandImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 19)
                                }
                                
                                CrossServeCardContent
                                
                                if let link = config.link {
                                    link
                                }
                            }
                        }
                    }
                    
                    if let button = config.button {
                        button
                    }
                }
                if config.price != nil || config.footerHelpText != nil {
                    Separator(type: .horizontal)
                        .padding(.vertical, brandSpacing.containerSpacing.padding.s)
                    
                    CrossServeCardFooter
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, brand == .de ? brandSpacing.containerSpacing.padding.l : brandSpacing.containerSpacing.padding.m)
            .padding(.vertical, brandSpacing.containerSpacing.padding.m)
            .brandBorderOverlay(
                radiusKey: .l,
                strokeKey: .regular,
                color: config.isSelected ? colorToken(brand == .de ? .borderDefaultPrimary : .primaryBase) : colorToken(brand == .de ? .borderDefaultSecondary : .borderDefaultTertiary)
            )
              
            .background(
                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                    topLeading: cornerRadius.l,
                    bottomLeading: cornerRadius.l,
                    bottomTrailing: cornerRadius.l,
                    topTrailing: cornerRadius.l
                ))
                .fill(colorToken(config.backgroundColor ?? .grayscale000))
            )
            if config.isSelected {
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
        VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.xs)  {
            Text(config.title)
                .typographyStyle(.h4)
                .fixedSize(horizontal: false, vertical: true)
            

            Text(config.description)
                .typographyStyle(.p1)
                .foregroundColor(colorToken(.grayscale700))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    @ViewBuilder
    private var CrossServeCardFooter: some View {
        VStack {
            if let price = config.price, let footerLink = config.footerLink {
                HStack {
                    price
                    Spacer()
                    footerLink
                }
            } else if let footerHelpText = config.footerHelpText {
                VStack {
                    Text(footerHelpText)
                        .typographyStyle(.p1)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}

struct CrossServeCardPrice: View , BrandStyleSupport  {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
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
