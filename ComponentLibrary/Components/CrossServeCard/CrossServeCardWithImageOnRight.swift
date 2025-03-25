import SwiftUI
struct CrossServeCardWithImageOnRight: View {
    var image: String
    var tag: Tag? = nil
    var brandImage: String? = nil
    var enrollText: String? = nil
    var title: String
    var description: String
    var button: Button
    var footerHelpText: String? = nil
    var imageOnRight: Bool = true

    var body: some View {
        CrossServeCard(config: CrossServeCardConfig(
            image: image,
            tag: tag,
            brandImage: brandImage,
            enrollText: enrollText,
            title: title,
            description: description,
            button: button,
            footerHelpText: footerHelpText,
            imageOnRight: imageOnRight
            )
        )
    }
}
