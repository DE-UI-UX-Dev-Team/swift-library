import SwiftUI

struct InfoItemModel: Identifiable {
    let id = UUID()
    let title: String
    let value: String
}

struct InfoSection: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand

    let heading: String?
    let items: [InfoItemModel]

    // Provide default value for `heading`
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

