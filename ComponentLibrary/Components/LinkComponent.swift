
import SwiftUI

enum LinkVariant {
    case text
    case accordion(isExpanded: Bool)
    case inlineURL(links: [(text: String, url: URL)])
}

struct Link: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand

    let text: String
    let variant: LinkVariant
    let isInline: Bool
    let action: () -> Void

    init(
        text: String,
        variant: LinkVariant,
        isInline: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.variant = variant
        self.isInline = isInline
        self.action = action
    }

    var body: some View {
        let style = LinkStyleConfig.get(for: self)

        switch variant {
        case .inlineURL(let links):
            Text(attributedText(with: links, style: style))
                .foregroundColor(style.foregroundColor)

        case .text, .accordion:
            SwiftUI.Button(action: action) {
                HStack(spacing: 4) {
                    createStyledText(style: style)

                    if case let .accordion(isExpanded) = variant {
                        accordionIcon(isExpanded: isExpanded, color: style.foregroundColor)
                    }
                }
            }
            .buttonStyle(.plain)
        }
    }

    // AttributedString for inlineURL variant with multiple links
    private func attributedText(with links: [(text: String, url: URL)], style: LinkStyleConfig) -> AttributedString {
        var attributedString = AttributedString(text)
        attributedString.foregroundColor = colorToken(.grayscale900)
        
        for link in links {
            if let range = attributedString.range(of: link.text) {
                attributedString[range].link = link.url
                attributedString[range].foregroundColor = style.foregroundColor
                if style.applyUnderline {
                    attributedString[range].underlineStyle = .single
                }
            }
        }
        return attributedString
    }
    

    private func createStyledText(style: LinkStyleConfig) -> some View {
        let baseText = Text(text)

        return Group {
            if isInline {
                baseText
            } else {
                baseText.typographyStyle(style.typographyStyle)
            }
        }
        .foregroundColor(style.foregroundColor)
        .modifier(UnderlineModifier(applyUnderline: style.applyUnderline, color: style.foregroundColor))
    }

    private func accordionIcon(isExpanded: Bool, color: Color) -> some View {
        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            .foregroundColor(color)
    }
}

struct LinkStyleConfig {
    let foregroundColor: Color
    let applyUnderline: Bool
    let typographyStyle: MyTextStyle

    static func get(for context: some BrandStyleSupport) -> LinkStyleConfig {
        let styles: [Brand: LinkStyleConfig] = [
            .de: LinkStyleConfig(
                foregroundColor: context.colorToken(.primaryDarkest),
                applyUnderline: true,
                typographyStyle: .link
            ),
            .reliant: LinkStyleConfig(
                foregroundColor: context.colorToken(.primaryBase),
                applyUnderline: false,
                typographyStyle: .link
            )
        ]
        
        return styles[context.brand] ?? styles[.de]!
    }
}




