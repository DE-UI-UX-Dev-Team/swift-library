
import SwiftUI

struct PriceRatePage: View {

    var body: some View {
        VStack(spacing: 20) {
        PriceRate(price: "12.5", unit: "/kWh")
        PriceRate(price: "17.3", unit: "per kWh")
        }
    }
}

struct PriceRatePage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            PriceRatePage()
        }
    }
}
