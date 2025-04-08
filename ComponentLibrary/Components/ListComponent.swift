import SwiftUI

struct ListView: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
        let title: String?
        let items: [ListItem]
        let isInteractive: Bool
    
        init(
            title: String? = nil,
            items: [ListItem],
            isInteractive: Bool
        ) {
            self.title = title
            self.items = items
            self.isInteractive = isInteractive
        }
    @State private var navigateTo: AnyView? = nil
    @State private var isNavigationActive: Bool = false
    @State private var activeSheet: SheetWrapper?
    @State var show = false
    @State var height: CGFloat = 0

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.m) {
            
                if let title = title {
                        Text(title)
                            .typographyStyle(.h4) // Customize as needed
                }
                VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.s){
                    ForEach(items) { item in
                        HStack(
                            alignment: .center,
                            spacing: brand == .de ? brandSpacing.containerSpacing.gaps.m : brandSpacing.containerSpacing.gaps.s
                        ) {
                            item.leftIcon
                            
                            if let text = item.text {
                                if item.textStyle == .link {
                                    let linkStyle = LinkStyleConfig.get(for: self)
                                    Text(text)
                                        .typographyStyle(linkStyle.typographyStyle)
                                        .foregroundColor(linkStyle.foregroundColor)
                                        .underline(linkStyle.applyUnderline)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                } else {
                                    Text(text)
                                        .typographyStyle(item.textStyle ?? .p1)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            
                            Spacer()
                            
                            if let rightIcon = item.rightIcon {
                                rightIcon
                            }
                        }
                        .contentShape(Rectangle())
                        .if(isInteractive) { view in
                            view.onTapGesture {
                                handleListItemAction(item.action)
                            }
                        }
                    }
                }
            }
            
            .navigationDestination(isPresented: $isNavigationActive) {
                if let destination = navigateTo {
                    destination
                }
            }
            .adaptiveSheet(isPresent: $show) {
                if let sheet = activeSheet {
                    sheet.content(height)
                }
            }
        }
    }

    private func handleListItemAction(_ action: ListItemAction?) {
        guard let action = action else { return }

        switch action {
        case .navigate(let destination):
            ActionHandler.navigate(
                to: destination,
                navigateTo: $navigateTo,
                isNavigationActive: $isNavigationActive
            )

        case .downloadPDF(let url):
            ActionHandler.downloadPDF(from: url)

        case .showBottomSheet(let content):
            ActionHandler.showBottomSheet(
                content: { content },
                activeSheet: $activeSheet,
                show: $show
            )
        }
    }
}

