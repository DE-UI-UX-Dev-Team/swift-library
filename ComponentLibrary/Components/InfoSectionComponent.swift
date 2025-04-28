import SwiftUI

struct InfoItemModel: Identifiable {
    let id = UUID()
    var title: String?
    var value: String

    // ✅ Title first, value required, title has default
    init(title: String? = nil, value: String) {
        self.title = title
        self.value = value
    }
}
struct InfoSection: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand

    let heading: String?
    let items: [InfoItemModel]

    init(heading: String? = nil, items: [InfoItemModel]) {
        self.heading = heading
        self.items = items
    }

    var body: some View {
        VStack(alignment: .leading, spacing:  brand == .de ? brandSpacing.containerSpacing.gaps.m : brandSpacing.containerSpacing.gaps.s) {
            if let heading = heading {
                Text(heading)
                    .typographyStyle(brand == .de ? .h6 : .h4)
            }

            ForEach(items) { item in
                InfoItem(title: item.title, value: item.value)
            }
        }
    }
}

