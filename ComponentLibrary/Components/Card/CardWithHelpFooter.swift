import SwiftUI
struct CardWithHelpFooter: View {
    var image: String
    var tag: Tag? = nil
    var brandImage: String? = nil
    var enrollText: String? = nil
    var title: String
    var description: String
    var button: Button
    var footerHelpText: String

    var body: some View {
        Card(config: CardConfig(
            image: image,
            tag: tag,
            brandImage: brandImage,
            enrollText: enrollText,
            title: title,
            description: description,
            button: button,
            footerHelpText: footerHelpText
            )
        )
    }
}
