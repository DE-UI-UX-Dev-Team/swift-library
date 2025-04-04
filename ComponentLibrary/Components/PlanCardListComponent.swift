import SwiftUI

struct PlanCardList: View {
    @Binding var selectedPlanID: UUID? 
    let plans: [PlanCard]

    var body: some View {
        VStack(spacing: 20) {
            ForEach(plans) { plan in
                planCardView(for: plan)
            }
        }
    }

    private func planCardView(for plan: PlanCard) -> some View {
        PlanCard(
            cardTitle: plan.cardTitle,
            title: plan.title,
            subtitle: plan.subtitle,
            priceRate: plan.priceRate,
            priceDescription: plan.priceDescription,
            tags: plan.tags,
            promotionalTags: plan.promotionalTags,
            link: plan.link,
            planImage: plan.planImage,
            withAutoPay: plan.withAutoPay,
            isSelected: Binding(
                get: { selectedPlanID == plan.id },
                set: { newValue in
                    if newValue {
                        selectedPlanID = plan.id
                    } else if selectedPlanID == plan.id {
                        selectedPlanID = nil
                    }
                }
            )
        )
    }
}
