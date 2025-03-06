import SwiftUI
import UIKit
import Macaw

extension SwiftUI.Color {
    func toUIColor() -> UIColor {
        let uiColor = UIColor(self)  // Convert SwiftUI Color to UIColor
        return uiColor
    }
  
    
        func toMacawColor() -> Macaw.Color {
            let uiColor = UIColor(self) // Convert SwiftUI Color to UIColor
            guard let components = uiColor.cgColor.components else {
                return Macaw.Color.black
            }
            
            let red = Int((components[0]) * 255) << 16
            let green = Int((components[1]) * 255) << 8
            let blue = Int((components[2]) * 255)
            
            return Macaw.Color(val: red | green | blue)
        }
}

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
