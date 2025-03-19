
import SwiftUI

protocol BrandStyleSupport {
    var brand: Brand { get }
    var colorScheme: ColorScheme { get }
}

extension BrandStyleSupport {
    var brandSpacing: BrandSpacing {
        SpacingTokenManager.shared.spacing(for: brand)
    }
    
    func colorToken(_ token: ColorToken) -> Color {
        token.color(brand: brand, colorScheme: colorScheme)
    }
    
    var cornerRadius: BorderRadius {
        BorderUtilities.cornerRadius(for: brand)
    }
}
