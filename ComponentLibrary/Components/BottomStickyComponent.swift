
import SwiftUI


struct BottomSticky<Content: View>: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            content
        }
        .padding(.horizontal, brandSpacing.containerSpacing.padding.m)
        .padding(.vertical, brandSpacing.containerSpacing.padding.m)
   
        .frame(maxWidth: .infinity)
        .background(
                    Rectangle()
                        .fill(colorToken(.containerFillGrayDefault))
                        .ignoresSafeArea(edges: .bottom)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: -10)
                )
    }

}


struct BottomSticky_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            VStack {
                Spacer()
                BottomSticky {
                    VStack {
                        Text("Custom Content")
                            .typographyStyle(.h6)
                        Button(
                            title: "Action",
                            variant: .secondary
                        ) {
                            print("Action tapped")
                        }
                    }
                }
            }
        }
    }
}
