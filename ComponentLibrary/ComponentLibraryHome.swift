import SwiftUI

struct ComponentLibraryHome: View {
    @State private var searchText = ""
    let components: [(String, AnyView, String)] = [
        ("Buttons", AnyView(ButtonView()), "rectangle.grid.1x2"),
        ("Links", AnyView(LinkPage()), "rectangle.grid.1x2"),
        ("Tags", AnyView(TagDemoPage()), "rectangle.grid.1x2"),
        ("Separator", AnyView(SeparatorDemoPage()), "rectangle.grid.1x2"),
        ("Input", AnyView(InputPage()), "rectangle.grid.1x2"),
        ("Stepper", AnyView(StepperPage()), "rectangle.grid.1x2"),
        ("Hero", AnyView(HeroPage()), "inset.filled.rectangle"),
        ("Plan Card", AnyView(PlanCardPage()), "inset.filled.rectangle"),
        ("Card", AnyView(CardPage()), "inset.filled.rectangle"),
        ("Information", AnyView(InformationPage()), "inset.filled.rectangle"),
        ("Tabs", AnyView(TabsPage()), "inset.filled.rectangle"),
        ("ColorTokenSystem", AnyView(ColorSwatches()), "rectangle.fill.on.rectangle.fill"),
        ("TypographyTokenSystem", AnyView(FontsPage()), "rectangle.fill.on.rectangle.fill"),
        ("BorderTokenSystem", AnyView(BorderPage()), "rectangle.fill.on.rectangle.fill"),
        ("SpacingTokenSystem", AnyView(SpacingPage()), "rectangle.fill.on.rectangle.fill"),
    ]
1
    var filteredComponents: [(String, AnyView, String)] {
        if searchText.isEmpty {
            return components
        } else {
            return components.filter { $0.0.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section(header: Header(title: "NRG UI Components Library")) {
                    ForEach(filteredComponents, id: \.0) { item in
                        NavigationLink(destination: item.1) {
                            HStack {
                                Image(systemName: item.2)
                                    .foregroundColor(.blue)
                                    .frame(width: 30)
                                Text(item.0)
                                    .font(.headline)
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Component Library")
            .searchable(text: $searchText, prompt: "Search Components")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Text("Component Library")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
            
        }
    }
}

struct ComponentLibraryHome_Previews: PreviewProvider {
    static var previews: some View {
        ComponentLibraryHome()
    }
}
