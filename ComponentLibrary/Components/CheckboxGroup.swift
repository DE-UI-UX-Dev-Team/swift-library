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
    let title: String
    @State private var selectedValues: String = ""
    @State private var items: [CheckboxGroupItem]
    let buttonTitle: String
    let buttonAction: () -> Void
    
   
    private let maxTruncatedLength: Int = 100
    
   
    private var areAllItemsSelected: Bool {
        let selectedCount = selectedValues.isEmpty ? 0 : selectedValues.split(separator: ",").count
        return selectedCount == items.count
    }
    
    init(title: String, items: [String], buttonTitle: String, buttonAction: @escaping () -> Void) {
        self.title = title
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.m) {

            Text(title)
                .typographyStyle(.h2)
                .foregroundColor(colorToken(.grayscale900))
            
   
            ForEach($items) { $item in
                VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.s) {
    
                    SwiftUI.Button(action: {
                        var newValues = Set(selectedValues.split(separator: ",").map(String.init))
                        if newValues.contains(item.value) {
                            newValues.remove(item.value)
                        } else {
                            newValues.insert(item.value)
                        }
                        selectedValues = newValues.joined(separator: ",")
                    }) {
                        HStack {
                            CustomCheckbox(
                                isSelected: selectedValues.split(separator: ",").map(String.init).contains(item.value),
                                isDisabled: false,
                                isError: false
                            )
                            // Display truncated or full text based on isExpanded
                            if item.label.count > maxTruncatedLength && !item.isExpanded {
                                Text(item.label.prefix(maxTruncatedLength) + "...")
                                    .typographyStyle(.p2)
                                    .foregroundColor(colorToken(.grayscale900))
                            } else {
                                Text(item.label)
                                    .typographyStyle(.p2)
                                    .foregroundColor(colorToken(.grayscale900))
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if item.label.count > maxTruncatedLength {
                        Text(item.isExpanded ? "Show less" : "Show more")
                            .typographyStyle(.p2)
                            .foregroundColor(colorToken(.primaryBase))
                            .onTapGesture {
                                item.isExpanded.toggle()
                            }
                    }
                }
            }
            

            Button(
                title: buttonTitle,
                variant: areAllItemsSelected ? .secondary : .disabled
            ) {
                if areAllItemsSelected {
                    buttonAction()
                }
            }
            .disabled(!areAllItemsSelected)
        }
        .padding(brandSpacing.containerSpacing.padding.l)
    }
}


