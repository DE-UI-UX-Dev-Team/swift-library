import SwiftUI

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
    let maxLines: Int
    
    init(
        title: String,
        items: [CheckboxGroupItem],
        termsText: String? = nil,
        termUrl: String? = nil,
        buttonTitle: String,
        buttonAction: @escaping () -> Void,
        maxLines: Int = 2
    ) {
        self.title = title
        self.termsText = termsText
        self.termUrl = termUrl
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        self.maxLines = maxLines
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
                        maxLines: maxLines
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
