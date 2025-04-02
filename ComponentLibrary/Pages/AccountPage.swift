
import SwiftUI



struct AccountPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var navigationManager: BottomBarManager
    @State private var isNavigatingToRenewPlan: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Account Page")
                    .typographyStyle(.h2)

                Button(
                    title: "Renew Plan",
                    variant: .primary,
                    size: .small
                ) {
                    navigationManager.isBottomBarVisible = false
                    isNavigatingToRenewPlan = true
                }

                Spacer()
            }
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $isNavigatingToRenewPlan) {
                RenewPlanPage()
            }
            .onAppear {
                navigationManager.isBottomBarVisible = true
            }
        }
    }
}

struct AccountPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            AccountPage()
                .environmentObject(BottomBarManager())
        }
    }
}
