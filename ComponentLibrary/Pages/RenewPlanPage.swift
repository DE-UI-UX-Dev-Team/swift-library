
import SwiftUI

struct RenewPlanPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
            VStack(spacing: 20) {
                Text("Renew Plan")
                    .typographyStyle(.h3)

                Text("This is a sample Renew Plan page.")
                    .typographyStyle(.p1)

                Spacer()
            }
            .navigationTitle("Renew Plan")
            .padding()
        }
    }


struct RenewPlanPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
                RenewPlanPage()
       
        }
    }
}
