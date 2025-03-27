import SwiftUI

struct CardWithPriceFooter: View {
    var image: String
    var tag: Tag? = nil
    var brandImage: String? = nil
    var enrollText: String? = nil
    var title: String
    var description: String
    var link: Link
    var price: CardPrice
    var footerLink: Link

    var body: some View {
        Card(config: CardConfig(
            image: image,
            tag: tag,
            brandImage: brandImage,
            enrollText: enrollText,
            title: title,
            description: description,
            link: link,
            price: price,
            footerLink: footerLink
            )
        )
    }
}
