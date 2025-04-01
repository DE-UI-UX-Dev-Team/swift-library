import SwiftUI


struct CheckboxGroupItem: Identifiable {
    let id = UUID()
    let label: String
    let value: String
    var isExpanded: Bool
}


struct CheckboxGroup: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
    @State private var selectedValues: String = ""
    @State private var items: [CheckboxGroupItem]
    
    let title: String
    let termsText: String?
    let termUrl: String?
    let buttonTitle: String
    let buttonAction: () -> Void
    
    init(
        title: String,
        items: [String],
        termsText: String? = nil,
        termUrl: String? = nil,
        buttonTitle: String,
        buttonAction: @escaping () -> Void
    ) {
        self.title = title
        self.termsText = termsText
        self.termUrl = termUrl
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        self._items = State(initialValue: items.enumerated().map { (index, label) in
            CheckboxGroupItem(
                label: label,
                value: "option_\(index)",
                isExpanded: false
            )
        })
    }
 
    
    private let maxTruncatedLength: Int = 110

    private var areAllItemsSelected: Bool {
        let selectedCount = selectedValues.isEmpty ? 0 : selectedValues.split(separator: ",").count
        return selectedCount == items.count
    }
    
    
    private func createAttributedText(from label: String) -> AttributedString {
            let linkPlaceholder = "<termText>"
            let displayTermsPlaceholder = termsText ?? "terms and conditions"
            let displayURL = termUrl ?? "https://example.com"
            
            let modifiedLabel = label.replacingOccurrences(of: linkPlaceholder, with: displayTermsPlaceholder)
            var attributedString = AttributedString(modifiedLabel)
            
            if let linkRange = attributedString.range(of: displayTermsPlaceholder) {
                attributedString[linkRange].link = URL(string: displayURL)!
                attributedString[linkRange].foregroundColor = brand == .de ? colorToken(.primaryDarkest) :colorToken(.primaryBase)
            }
            
            return attributedString
        }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.s) {
            Text(title)
                .typographyStyle(.h4)
            
            VStack(alignment: .leading, spacing: brand == .de ? brandSpacing.containerSpacing.gaps.m : brandSpacing.containerSpacing.gaps.s){
                ForEach($items) { $item in
                    
                    SwiftUI.Button(action: {
                        var newValues = Set(selectedValues.split(separator: ",").map(String.init))
                        if newValues.contains(item.value) {
                            newValues.remove(item.value)
                        } else {
                            newValues.insert(item.value)
                        }
                        selectedValues = newValues.joined(separator: ",")
                    }) {
                        HStack(alignment: .top, spacing: brand == .de ? brandSpacing.containerSpacing.gaps.m : brandSpacing.containerSpacing.gaps.s) {
                            
                            CustomCheckbox(
                                isSelected: selectedValues.split(separator: ",").map(String.init).contains(item.value),
                                isDisabled: false,
                                isError: false
                            )
                            
                            VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.s) {
                                if item.label.contains("<termText>") {
                                    let attributedText = createAttributedText(from: item.label)
                                            Text(attributedText)
                                                .typographyStyle(.p1)
                                                        } else {
                                       if item.label.count > maxTruncatedLength && !item.isExpanded {
                                                         Text(item.label.prefix(maxTruncatedLength) + "...")
                                                                .typographyStyle(.p1)
                                                                      
                                                         } else {
                                                         Text(item.label)
                                                               .typographyStyle(.p1)

                                                                        }
                                     if item.label.count > maxTruncatedLength {
                                                 Text(item.isExpanded ? "Show less" : "Show more")
                                                  .typographyStyle(.p1)
                                                  .foregroundColor(colorToken(brand == .de ? .primaryDarkest : .primaryBase))
                                               .onTapGesture {
                                                 item.isExpanded.toggle()
                                                            } }
                                                         }
                                        }
                            
                            

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal,brandSpacing.containerSpacing.padding.m)
                        .padding(.vertical,brandSpacing.containerSpacing.padding.s)
                        .brandBorderOverlay(
                            radiusKey: .s,
                            strokeKey: .thin,
                            color: selectedValues.split(separator: ",").map(String.init).contains(item.value)
                            ? colorToken(brand == .de ? .borderDefaultPrimary : .primaryBase)
                            : colorToken(brand == .de ? .borderDefaultSecondary : .borderDefaultTertiary)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
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
            .padding(.top,brandSpacing.containerSpacing.padding.s)
        }
       
    }
}
