import SwiftUI


struct PlanCard: View, Identifiable, BrandStyleSupport {
    let id = UUID()
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme)  var colorScheme

    @State private var isToggleOn: Bool = false
    @State private var isSelected: Bool = false

    
    let cardTitle: String
    let title: String
    let subtitle: String
    let priceRate: PriceRate
    let priceDescription: String
    let tags: [Tag]?
    let promotionalTags: [Tag]?
    let link: Link?
    let planImage: Image?
    let withAutoPay: Bool

    
    init(
        cardTitle: String,
        title: String ,
        subtitle: String ,
        priceRate: PriceRate,
        priceDescription: String,
        tags: [Tag]? = nil,
        promotionalTags: [Tag]? = nil,
        link: Link? = nil,
        planImage: Image? = nil,
        withAutoPay: Bool = false,
        isSelected: Bool = false
    ) {
        self.cardTitle = cardTitle
        self.title = title
        self.subtitle = subtitle
        self.priceRate = priceRate
        self.priceDescription = priceDescription
        self.tags = tags
        self.promotionalTags = promotionalTags
        self.link = link
        self.planImage = planImage
        self.withAutoPay = withAutoPay
        self._isSelected = State(initialValue: isSelected)
    }
    

    
    var body: some View {
        VStack(spacing: 0) {
            PlanCardHeader
            PlanCardContent
            if brand == .reliant {
                Separator(type: .horizontal)
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.m)
            }
            PlanCardFooter
        }
        .brandBorderOverlay(
            radiusKey: .l,
            strokeKey: .regular,
            color: isSelected ? colorToken(brand == .de ? .borderDefaultPrimary : .primaryBase) : colorToken(brand == .de ? .borderDefaultSecondary : .borderDefaultTertiary)
        )
                .onTapGesture {
                        isSelected.toggle()
                }
    }
    

    @ViewBuilder
    private var PlanCardHeader: some View {
        HStack {
            Text(cardTitle)
                .typographyStyle(brand == .de ? .p1 : .p2)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(colorToken(brand == .de ? .iconDefaultAccessible : .iconDefaultPrimary))
                    .font(.system(size: 18))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(brandSpacing.containerSpacing.padding.m)
        .background(
            RoundedRectangle(cornerRadius: 0)
                .fill(colorToken(brand == .de ? (withAutoPay ? .containerFillPastelAlt : .containerFillGray3) : .containerFillSecondaryDefault))
                .mask(
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: cornerRadius.l,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        topTrailing: cornerRadius.l
                    ))
                )
        )
    }
    

    @ViewBuilder
    private var PlanCardContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let tags = tags, !tags.isEmpty {
                HStack(spacing: brandSpacing.containerSpacing.gaps.xs) {
                    ForEach(tags, id: \.text) { tag in
                        tag
                    }
                }
                .padding(.bottom, brandSpacing.containerSpacing.padding.m)
            }
            
            HStack(alignment: .top, spacing: brandSpacing.containerSpacing.padding.m) {
                if let planImage = planImage {
                    planImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                        .cornerRadius(cornerRadius.m)
                }
                
                VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.xs) {
                    Text(title)
                        .typographyStyle(brand == .de ? .h5 : .h6)
                        .foregroundColor(colorToken(.grayscale900))
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(subtitle)
                        .typographyStyle(.p2)
                        .foregroundColor(colorToken(.grayscale700))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            
            if let promotionalTags = promotionalTags, !promotionalTags.isEmpty {
                HStack(spacing: brandSpacing.containerSpacing.gaps.xs) {
                    ForEach(promotionalTags, id: \.text) { promoTag in
                        promoTag
                    }
                }
                .padding(.top, brandSpacing.containerSpacing.padding.m)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, brand == .de ? brandSpacing.containerSpacing.padding.l : brandSpacing.containerSpacing.padding.m)
        .padding(.vertical, brandSpacing.containerSpacing.padding.m)
        .background(colorToken(brand == .de ? (withAutoPay ? .pageFillPrimaryDefault : .containerFillGray2) : .containerFillGrayDefault))
    }
    

    @ViewBuilder
    private var PlanCardFooter: some View {
        VStack(spacing: 0) {
            HStack {
                if let link = link {
                    VStack(alignment: .leading) {
                        if withAutoPay {
                            HStack(spacing: 6) {
                                Toggle("", isOn: $isToggleOn)
                                    .labelsHidden()
                                    .toggleStyle(SwitchToggleStyle(tint: colorToken(.primaryBase)))
                                Text("Auto Pay")
                                    .typographyStyle(.p2)
                                    .foregroundColor(colorToken(.grayscale900))
                            }
                        }
                        link
                            .padding(.top, withAutoPay ? 0 : brandSpacing.containerSpacing.padding.m)
                    }
                }
                Spacer()
                            
                VStack(alignment: .trailing)  {
                                    priceRate
                                        .foregroundColor(
                                                            withAutoPay ?
                                                            colorToken(brand == .de ? .greenAccessible : .grayscale900) :
                                                            colorToken(.grayscale900))
                                      Text(priceDescription)
                                          .typographyStyle(brand == .de ?.p3:.p2)
                                          .foregroundColor(colorToken(.grayscale700))
                                  }
               

            }
        }
        .padding(.horizontal, brand == .de ? brandSpacing.containerSpacing.padding.l : brandSpacing.containerSpacing.padding.m)
        .padding(.vertical, brandSpacing.containerSpacing.padding.m)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
