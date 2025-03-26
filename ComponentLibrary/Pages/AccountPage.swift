
import SwiftUI

struct AccountPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Account Page")
                    .typographyStyle(.h2)

                NavigationLink(destination: RenewPlanPage()) {
                    Text("Renew Plan")
                        .typographyStyle(.h3)
                        .foregroundColor( colorToken(.tertiaryBase))
                }

                Spacer()
            }
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AccountPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            AccountPage()
        }
    }
}

