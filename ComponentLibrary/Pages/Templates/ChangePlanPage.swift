
import SwiftUI

struct ChangePlanPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Change Plan Page")
                .navigationTitle("Change Plan")
        }
    }
}


struct ChangePlanPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            ChangePlanPage()
        }
        
    }
}
