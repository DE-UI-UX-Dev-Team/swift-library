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

                    Tag(
                        text: "Recommended",
                        style: .active(.tertiaryBase),
                        icon: Image(systemName: "star.fill"),
                        iconPosition: .left
                    )

                    Tag(
                        text: "$200 Bill Credit",
                        style: .active(.primaryBase)
                    )
                    
                    Tag(
                        text: "Tag Label",
                        style: .active(.greenBase)
                    )

                    Spacer().frame(height: 10)

                    Text("Inactive Tags")
                        .font(.headline)

                    Tag(
                        text: "Inactive",
                        style: .inactive
                    )

                    Spacer().frame(height: 10)

                    Text("Status Tags")
                        .font(.headline)

                    Tag(
                        text: "-10%",
                        style: .warning,
                        icon: Image(systemName: "arrow.down"),
                        iconPosition: .left
                    )

                    Tag(
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
