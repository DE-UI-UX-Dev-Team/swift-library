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
    
    init(
        title: String,
        items: [String],
        buttonTitle: String,
        buttonAction: @escaping () -> Void
    ) {
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
        VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.s) {
            Text(title)
                .typographyStyle(.h4)
            
            VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.s){
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
                        HStack(alignment: .center, spacing: brand == .de ? brandSpacing.containerSpacing.gaps.m : brandSpacing.containerSpacing.gaps.s) {
                            
                            CustomCheckbox(
                                isSelected: selectedValues.split(separator: ",").map(String.init).contains(item.value),
                                isDisabled: false,
                                isError: false
                            )
                            
                            
                            VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.s) {
                           
                                    if item.label.count > maxTruncatedLength && !item.isExpanded {
                                        HStack{
                                            Text(item.label.prefix(maxTruncatedLength) + "...")
                                                .typographyStyle(.p1)
                                            Text("terms")}
                                    } else {
                                        HStack{
                                            Text(item.label)
                                                .typographyStyle(.p1)
                                            Text("terms")}
                                    }
                               
                                
                                if item.label.count > maxTruncatedLength {
                                    Text(item.isExpanded ? "Show less" : "Show more")
                                        .typographyStyle(.p1)
                                        .foregroundColor(colorToken(.primaryBase))
                                        .onTapGesture {
                                            item.isExpanded.toggle()
                                        }
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


