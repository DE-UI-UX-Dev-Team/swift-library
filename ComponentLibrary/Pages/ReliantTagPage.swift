import SwiftUI

struct TagDemoPage: View {
    @State private var selectedBrand: Brand = .reliant
    var body: some View {
        VStack(spacing: 20) {
            Text("Tag Component Demo")
                .typographyStyle(.h1, brand: selectedBrand)

            VStack(spacing: 10) {
                
                    Text("Active Tags")
                        .font(.headline)

                    // Tag with an icon
                    TagView(
                        text: "Recommended",
                        style: .active(ColorToken.tertiaryBase),
                        selectedBrand: selectedBrand,
                        icon: Image(systemName: "star.fill"),
                        iconPosition: .left
                    )

                    // Tag without an icon
                    TagView(
                        text: "$200 Bill Credit",
                        style: .active(ColorToken.primaryBase),
                        selectedBrand: selectedBrand
                    )
                    
                    // Tag without an icon=
                    TagView(
                        text: "Tag Label",
                        style: .active(ColorToken.greenBase),
                        selectedBrand: selectedBrand
                    )

                    Spacer().frame(height: 10)

                    Text("Inactive Tags")
                        .font(.headline)

                    // Tag without an icon
                    TagView(
                        text: "Inactive",
                        style: .inactive,
                        selectedBrand: selectedBrand
                    )

                    Spacer().frame(height: 10)

                    Text("Status Tags")
                        .font(.headline)

                    // Tag with an icon
                    TagView(
                        text: "-10%",
                        style: .warning,
                        selectedBrand: selectedBrand,
                        icon: Image(systemName: "arrow.down"),
                        iconPosition: .left
                    )

                    // Tag without an icon
                    TagView(
                        text: "+20%",
                        style: .success,
                        selectedBrand: selectedBrand,
                        icon: Image(systemName: "arrow.up"),
                        iconPosition: .left
                    )
                    
                
            }
            .padding()
        }
        .padding()
    }
}

struct TagDemoPage_Previews: PreviewProvider {
    static var previews: some View {
        TagDemoPage()
    }
}

