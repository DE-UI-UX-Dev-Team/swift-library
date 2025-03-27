import SwiftUI


struct ConfirmationDetails: View , BrandStyleSupport {
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme)  var colorScheme
 

    let id = UUID()
    let requestDate: String
    let confirmationNumber: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.s) {
 
            Text("Confirmation details")
                .typographyStyle(.h3)
            
   
            VStack(alignment: .leading,spacing: brandSpacing.containerSpacing.gaps.xs) {
                Text("Request submitted on")
                    .typographyStyle(.h6)
                Text(requestDate)
                    .typographyStyle(.p1)
            }
            

            VStack(alignment: .leading,spacing: brandSpacing.containerSpacing.gaps.xs) {
                Text("Confirmation number")
                    .typographyStyle(.h6)
                Text(confirmationNumber)
                    .typographyStyle(.p1)
            }
        }
        .padding(brandSpacing.containerSpacing.padding.m)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(colorToken(.containerFillGray1))
        .cornerRadius(cornerRadius.l)
    }
}
