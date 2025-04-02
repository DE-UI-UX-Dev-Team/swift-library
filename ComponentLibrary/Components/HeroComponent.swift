

import SwiftUI

struct Hero<Content: View>: View , BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand
    let backgroundImage: Image
    let subImage: Image?
    let titleText: String?
    let contentText: String?
    let hasCard: Bool
    @ViewBuilder let cardContent: () -> Content
    
    private let overlapAmount: CGFloat = 80
    

    init(
        backgroundImage: Image,
        subImage: Image? = nil,
        titleText: String? = nil,
        contentText: String? = nil,
        hasCard: Bool = false,
        @ViewBuilder cardContent: @escaping () -> Content = { EmptyView() }
    ) {
        self.backgroundImage = backgroundImage
        self.subImage = subImage
        self.titleText = titleText
        self.contentText = contentText
        self.hasCard = hasCard
        self.cardContent = cardContent
    }
    
    var body: some View {
        Group {
            if hasCard {
                VStack(alignment:.leading) {
                    backgroundImage
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 210)
                        .clipped()
                    
                    ZStack {
                        cardContent()
                            .padding(.horizontal, brandSpacing.containerSpacing.padding.m)
                            .offset(y: -overlapAmount)
                    }
                    .padding(.bottom, -overlapAmount)
                }
            }else {
                ZStack(alignment:.leading) {
                    backgroundImage
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height:  110)
                        .clipped()
                   
                    HStack{
                        VStack(alignment: .leading, spacing: brandSpacing.pageLayout.sectionSpacing.xs) {
                            if let titleText = titleText{
                                Text(titleText)
                                    .typographyStyle(brand ==  .de ? .h6 : .h4)
                                    .foregroundColor(.white)
                            }
                            if let contentText = contentText{
                                Text(contentText)
                                    .typographyStyle(brand ==  .de ? .p2 : .p1)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal, brandSpacing.containerSpacing.padding.m)
                        Spacer()
                        if let subImage = subImage{
                            subImage
                                .scaledToFill()
                        }
                    }
                   
                }
            }
        }
         .frame(maxWidth: .infinity)
        }
}

