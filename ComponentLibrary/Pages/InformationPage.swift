import SwiftUI

struct InformationPage: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.twoXL) {
                InfoSection(
                    heading: "Electricity account information",
                    items: [
                        InfoItemModel(title: "Service address", value: "1234 ADDRESS AVE\nHOUSTON, TX 77001"),
                        InfoItemModel(title: "ESID", value: "1033492939819382908")
                    ]
                )
            

                InfoSection(
                    heading: "Contract information",
                    items: [
                        InfoItemModel(title: "Contract term", value: "24 months"),
                        InfoItemModel(title: "Contract begins", value: "On the meter read after 01/01/2023"),
                        InfoItemModel(title: "Contract ends", value: "On the meter read after the 14th month of service"),
                        InfoItemModel(title: "Early cancellation fee", value: "$295.00")
                    ]
                )
                
                InfoSection(
                    heading: "Confirmation details",
                    items: [
                        InfoItemModel(title: "Request submitted on", value: "01/01/2023"),
                        InfoItemModel(title: "Confirmation number", value: "0000000123456778901")
                    ]
                )
                
                InfoSection(
                    items: [
                        InfoItemModel(title: "Account name", value: "Firstname Lastname"),
                        InfoItemModel(title: "Account number", value: "1234567-1"),
                        InfoItemModel(title: "Service address", value: "1234 ADDRESS DR\nHOUSTON, TX 77002"),
                        InfoItemModel(title: "ESID", value: "1033492939819382908")
                    ]
                )
            }
           
        }.pageMargins()
    }
}

struct InfoItemPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            InformationPage()
        }
    }
}

