import SwiftUI

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension SwiftUI.Color {
     func toUIColor() -> UIColor {
         let uiColor = UIColor(self)  // Convert SwiftUI Color to UIColor
         return uiColor
     }
}

extension Color {
    init?(hex: String) {
        let sanitizedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgbValue: UInt64 = 0
        guard Scanner(string: sanitizedHex).scanHexInt64(&rgbValue) else {
            return nil
        }
 
        let length = sanitizedHex.count
        switch length {
        case 6:
            let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let b = Double(rgbValue & 0x0000FF) / 255.0
            self = Color(red: r, green: g, blue: b)
        case 8:
            let r = Double((rgbValue & 0xFF000000) >> 24) / 255.0
            let g = Double((rgbValue & 0x00FF0000) >> 16) / 255.0
            let b = Double((rgbValue & 0x0000FF00) >> 8) / 255.0
            let a = Double(rgbValue & 0x000000FF) / 255.0
            self = Color(red: r, green: g, blue: b, opacity: a)
        default:
            return nil
        }
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
   
    func pageMargins() -> some View {
        self.modifier(PageMarginModifier())
    }
    
    func adaptiveSheet<Content: View>(isPresent: Binding<Bool>, @ViewBuilder sheetContent: @escaping () -> Content) -> some View {
        modifier(AdaptiveSheetModifier(isPresented: isPresent, sheetContent: sheetContent))
    }
    
}

