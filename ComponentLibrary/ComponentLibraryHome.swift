import SwiftUI

struct ComponentLibraryHome: View {
    @State private var searchText = ""

    let components: [(String, AnyView, String)] = [
        ("Buttons", AnyView(ButtonView()), "rectangle.grid.1x2"),
        ("ReliantFontsPage", AnyView(ReliantFontsPage()), "rectangle.fill.on.rectangle.fill"),
    ]

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
                Section(header: HeaderComponent(title: "NRG UI Components Library")) {
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
