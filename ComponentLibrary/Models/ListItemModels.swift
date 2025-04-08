import SwiftUI

enum ListItemAction {
    case navigate(destination: AnyView)
    case downloadPDF(url: URL)
    case showBottomSheet(sheetContent: AnyView)
    
}

struct ListItem: Identifiable {
    let id = UUID()
    let leftIcon: Icon
    let text: String?
    let textStyle: MyTextStyle?
    let rightIcon: Icon?
    let action: ListItemAction?
    
    init(
        leftIcon: Icon,
        text: String? = nil,
        textStyle: MyTextStyle? = nil,
        
        rightIcon: Icon? = nil,
        action: ListItemAction? = nil
    ) {
        self.leftIcon = leftIcon
        self.text = text
        self.textStyle = textStyle
        self.rightIcon = rightIcon
        self.action = action
    }
}

struct SheetWrapper {
    let contentBuilder: (CGFloat) -> AnyView

    func content(_ height: CGFloat) -> AnyView {
        contentBuilder(height)
    }
}
 

