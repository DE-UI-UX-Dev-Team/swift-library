import SwiftUI

struct InfoItem: View , BrandStyleSupport{
    var title: String?
    var value: String
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme)  var colorScheme
    var body: some View {
        VStack(alignment: .leading, spacing:  brand == .de ? brandSpacing.containerSpacing.gaps.s : brandSpacing.containerSpacing.gaps.xs) {
            if let title = title {
                Text(title)
                    .typographyStyle(brand == .de ? .p2 : .p1)
                    .fontWeight(.medium)
            }
            Text(value)
                .typographyStyle(brand == .de ? .p3 : .p1)
        }
    }
}

