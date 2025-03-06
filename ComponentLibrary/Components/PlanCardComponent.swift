
import SwiftUI


struct TagConfig {
    let text: String
    let style: TagView.TagStyle
    let icon: Image?
    let iconPosition: TagView.IconPosition?
    
    init(
        text: String,
        style: TagView.TagStyle,
        icon: Image? = nil,
        iconPosition: TagView.IconPosition? = nil
    ) {
        self.text = text
        self.style = style
        self.icon = icon
        self.iconPosition = iconPosition
    }
}


struct LinkConfig {
    let text: String
    let variant: LinkVariant
    let isInline: Bool
    let action: () -> Void
}

enum PlanCardVariant {
    case unselected
    case selected
}

struct PlanCardComponent: View {
    @Environment(\.brand) private var brand
    @Environment(\.colorScheme) private var colorScheme
    
    private var brandSpacing: BrandSpacing {
        SpacingTokenManager.shared.spacing(for: brand)
    }
    
    private func colorToken(_ token: ColorToken) -> Color {
        token.color(brand: brand, colorScheme: colorScheme)
    }
    
    private var isSelected: Bool {
        variant == .selected
    }
    
    let cardTitle: String
    let title: String
    let subtitle: String
    let price: String
    let priceDescription: String
    let tags: [TagConfig]
    let promotionalTags: [TagConfig]?
    let linkConfig: LinkConfig?
    let variant: PlanCardVariant
    
    init(
        cardTitle: String,
        title: String,
        subtitle: String,
        price: String,
        priceDescription: String,
        tags: [TagConfig],
        promotionalTags: [TagConfig]? = nil,
        linkConfig: LinkConfig? = nil,
        variant: PlanCardVariant
    ) {
        self.cardTitle = cardTitle
        self.title = title
        self.subtitle = subtitle
        self.price = price
        self.priceDescription = priceDescription
        self.tags = tags
        self.promotionalTags = promotionalTags
        self.linkConfig = linkConfig
        self.variant = variant
    }
    

    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(cardTitle)
                    .typographyStyle(.p2)
                Spacer()
                if isSelected {
                                   Image(systemName: "checkmark.circle.fill")
                                       .foregroundColor(colorToken(.primaryBase))
                                       .font(.system(size: 24))
                               }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(brandSpacing.containerSpacing.padding.m)
            .background(colorToken(.containerFillSecondaryDefault))
            

            VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.m) {
                

                if !tags.isEmpty {
                    HStack(spacing: brandSpacing.containerSpacing.gaps.xs) {
                        ForEach(tags, id: \.text) { tag in
                            TagView(
                                text: tag.text,
                                style: tag.style,
                                icon: tag.icon,
                                iconPosition: tag.iconPosition
                            )
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.xs) {
                    Text(title)
                        .typographyStyle(.h6)
                        .foregroundColor(colorToken(.grayscale900))
                    
                    Text(subtitle)
                        .typographyStyle(.p2)
                        .foregroundColor(colorToken(.grayscale700))
                    
                }
                
                if let promos = promotionalTags, !promos.isEmpty  {
                    HStack(spacing: brandSpacing.containerSpacing.gaps.xs) {
                        ForEach(promos, id: \.text) { promoTag in
                            TagView(
                                text: promoTag.text,
                                style: promoTag.style,
                                icon: promoTag.icon,
                                iconPosition: promoTag.iconPosition
                            )
                        }
                    }
                }
                
                SeparatorComponent(type: .horizontal)
                
                HStack {
                    if let linkConfig = linkConfig {
                        VStack {
                            LinkComponent(
                                text: linkConfig.text,
                                variant: linkConfig.variant,
                                isInline: linkConfig.isInline,
                                action: linkConfig.action
                            )
                        }
                        .padding(.top, brandSpacing.pageLayout.margins.top)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(price)
                            .typographyStyle(.h2)
                            .foregroundColor(colorToken(.grayscale900))
                        Text(priceDescription)
                            .typographyStyle(.p2)
                            .foregroundColor(colorToken(.grayscale700))
                    }
                }
            }
            .padding(brandSpacing.containerSpacing.padding.m)
        }
        .brandBorderOverlay(
            radiusKey: .l,
            strokeKey: .regular,
            color: isSelected ? colorToken(.primaryBase) : colorToken(.borderDefaultTertiary)
        )
    }
}

