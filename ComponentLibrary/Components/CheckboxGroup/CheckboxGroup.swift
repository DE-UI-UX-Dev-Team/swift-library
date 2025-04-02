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

struct CheckboxGroup: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
    
    @State private var selectedValues: Set<String> = []
    @State private var items: [CheckboxGroupItem]
    
    let title: String
    let termsText: String?
    let termUrl: String?
    let buttonTitle: String
    let buttonAction: () -> Void
    let maxTruncatedLength: Int
    
    init(
        title: String,
        items: [CheckboxGroupItem],
        termsText: String? = nil,
        termUrl: String? = nil,
        buttonTitle: String,
        buttonAction: @escaping () -> Void,
        maxTruncatedLength: Int = 110
    ) {
        self.title = title
        self.termsText = termsText
        self.termUrl = termUrl
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        self.maxTruncatedLength = maxTruncatedLength
        self._items = State(initialValue: items)
    }
    
    private var areAllItemsSelected: Bool {
        selectedValues.count == items.count
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.s) {
            Text(title)
                .typographyStyle(.h4)
            
            LazyVStack(alignment: .leading, spacing: brand == .de ? brandSpacing.containerSpacing.gaps.m : brandSpacing.containerSpacing.gaps.s) {
                ForEach($items) { $item in
                    CheckboxRow(
                        item: $item,
                        isSelected: selectedValues.contains(item.value),
                        toggleAction: {
                            if selectedValues.contains(item.value) {
                                selectedValues.remove(item.value)
                            } else {
                                selectedValues.insert(item.value)
                            }
                        },
                        maxTruncatedLength: maxTruncatedLength
                    )
                }
            }
            
            Button(
                title: buttonTitle,
                variant: areAllItemsSelected ? .primary : .disabled
            ) {
                if areAllItemsSelected {
                    buttonAction()
                }
            }
            .disabled(!areAllItemsSelected)
            .padding(.top, brandSpacing.containerSpacing.padding.s)
        }
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
