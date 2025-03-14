import SwiftUI

struct TagDemoPage: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tag Component Demo")
                .typographyStyle(.h1)

            VStack(spacing: 10) {
                
                    Text("Active Tags")
                        .font(.headline)

                    TagView(
                        text: "Recommended",
                        style: .active(.tertiaryBase),
                        icon: Image(systemName: "star.fill"),
                        iconPosition: .left
                    )

                    TagView(
                        text: "$200 Bill Credit",
                        style: .active(.primaryBase)
                    )
                    
                    TagView(
                        text: "Tag Label",
                        style: .active(.greenBase)
                    )

                    Spacer().frame(height: 10)

                    Text("Inactive Tags")
                        .font(.headline)

                    TagView(
                        text: "Inactive",
                        style: .inactive
                    )

                    Spacer().frame(height: 10)

                    Text("Status Tags")
                        .font(.headline)

                    TagView(
                        text: "-10%",
                        style: .warning,
                        icon: Image(systemName: "arrow.down"),
                        iconPosition: .left
                    )

                    TagView(
                        text: "+20%",
                        style: .success,
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
        PreviewWrapper { brand in
            TagDemoPage()
        }
    }
}
