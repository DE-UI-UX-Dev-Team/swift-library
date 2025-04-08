import SwiftUI


struct CheckboxGroupItem: Identifiable {
    let id = UUID()
    let label: String
    let inlineLinkLabel: [(text: String, url: URL)]?
    let value: String
    var isExpanded: Bool = false
    
    init(label: String, inlineLinkLabel: [(text: String, url: URL)]? = nil, value: String, isExpanded: Bool = false) {
        self.label = label
        self.inlineLinkLabel = inlineLinkLabel
        self.value = value
        self.isExpanded = isExpanded
    }
}


struct CheckboxRow: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
    @Binding var item: CheckboxGroupItem
    let isSelected: Bool
    let toggleAction: () -> Void
    let maxTruncatedLength: Int
    
    var body: some View {
        SwiftUI.Button(action: toggleAction) {
            HStack(alignment: .top, spacing: brand == .de ? brandSpacing.containerSpacing.gaps.m : brandSpacing.containerSpacing.gaps.s) {
                CustomCheckbox(
                    isSelected: isSelected,
                    isDisabled: false,
                    isError: false
                )
                
                VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.s) {
                    if let links = item.inlineLinkLabel {
                        Link(
                            text: item.label,
                            variant: .inlineURL(links: links),
                            isInline: true
                        )
                        .typographyStyle(.p1)
                    } else if item.label.count > maxTruncatedLength && !item.isExpanded {
                        Text(item.label.prefix(maxTruncatedLength) + "...")
                            .typographyStyle(.p1)
                    } else {
                        Text(item.label)
                            .typographyStyle(.p1)
                    }
                    
                    
                    if item.inlineLinkLabel == nil && item.label.count > maxTruncatedLength {
                        Text(item.isExpanded ? "Show less" : "Show more")
                            .typographyStyle(.p1)
                            .underline(brand == .de)
                            .foregroundColor(colorToken(brand == .de ? .primaryDarkest : .primaryBase))
                            .onTapGesture {
                                item.isExpanded.toggle()
                            }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, brandSpacing.containerSpacing.padding.m)
            .padding(.vertical, brandSpacing.containerSpacing.padding.s)
            .brandBorderOverlay(
                radiusKey: .s,
                strokeKey: .thin,
                color: isSelected
                    ? colorToken(brand == .de ? .borderDefaultPrimary : .primaryBase)
                    : colorToken(brand == .de ? .borderDefaultSecondary : .borderDefaultTertiary)
            )
            .accessibilityLabel("\(item.label), \(isSelected ? "selected" : "unselected")")
        }
        .buttonStyle(PlainButtonStyle())
    }
    
}
