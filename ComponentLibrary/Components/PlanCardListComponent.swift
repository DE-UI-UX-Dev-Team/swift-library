
import SwiftUI

struct PlanCardList: View {
    let plans: [PlanCard]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(plans) { plan in
                            plan
                        }
        }
    }
}
