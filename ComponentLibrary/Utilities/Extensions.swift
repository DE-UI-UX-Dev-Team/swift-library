import SwiftUI

 import UIKit
 import Macaw

 extension SwiftUI.Color {
     func toUIColor() -> UIColor {
         let uiColor = UIColor(self)  // Convert SwiftUI Color to UIColor
         return uiColor
     }
 }

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
