import SwiftUI

// MARK: - Underline Modifier
struct UnderlineModifier: ViewModifier {
    let applyUnderline: Bool
    let color: Color
    
    func body(content: Content) -> some View {
        if applyUnderline {
            content.underline(true, color: color)
        } else {
            content
        }
    }
}
