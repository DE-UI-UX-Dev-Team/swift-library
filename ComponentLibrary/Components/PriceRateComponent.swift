
import SwiftUI

struct PriceRate: View, BrandStyleSupport {
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme)  var colorScheme
 
    let price: String
    let unit: String

    
    var body: some View {
      
            HStack(spacing: 2) {
                Text(price)
                    .typographyStyle(brand == .de ? .cardRate : .h2)
 
                Text("¢")
                    .typographyStyle(brand == .de ? .p1 : .h2)
                    .baselineOffset(brand == .de ? 10 : 0)
                
                Text(unit)
                    .typographyStyle(brand == .de ? .p3 : .h2)
                    .padding(.top, brand == .de ? brandSpacing.containerSpacing.padding.s : 0)
                
        }
    }
}

