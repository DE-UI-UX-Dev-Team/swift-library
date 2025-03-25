import SwiftUI

struct CrossServeCardWithLink: View {
    var image: String
    var tag: Tag? = nil
    var brandImage: String? = nil
    var enrollText: String? = nil
    var title: String
    var description: String
    var link: Link

    var body: some View {
        CrossServeCard(config: CrossServeCardConfig(
            image: image,
            tag: tag,
            brandImage: brandImage,
            enrollText: enrollText,
            title: title,
            description: description,
            link: link
            )
        )
    }
}
