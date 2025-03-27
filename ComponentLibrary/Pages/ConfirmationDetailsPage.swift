
import SwiftUI

struct ConfirmationDetailsPage: View {
    
    var body: some View {
        VStack {
                    ConfirmationDetails(
                            requestDate: "01/01/2023",
                            confirmationNumber: "0000000123456778901"
                    )
                }
        .padding()
    }
}

struct ConfirmationDetails_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            ConfirmationDetailsPage()
        }
    }
}
