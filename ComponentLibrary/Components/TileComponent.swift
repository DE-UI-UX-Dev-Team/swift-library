
import SwiftUI

enum TileAlignment {
    case leftAlignment, centerAlignment
}

struct Tile: View , BrandStyleSupport {
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme)  var colorScheme

    let icon: Icon?
    let tag: Tag?
    let title: String?
    let titleColor: Color?
    let link: Link?
    let subTitle: String?
    let detailsText: String?
    let descText: String?
    let withChevronIcon: Bool?
    let button: Button?
    let accordionLink: Link?
    let tileAlignment: TileAlignment
    
    
    init(
        icon: Icon? = nil,
        tag: Tag? = nil,
        title: String? = nil,
        titleColor: Color? = nil,
        link: Link? = nil,
        subTitle: String? = nil,
        detailsText: String? = nil,
        descText: String? = nil,
        withChevronIcon: Bool = false,
        button: Button? = nil,
        accordionLink: Link? = nil,
        tileAlignment: TileAlignment
    ) {
        self.icon =  icon
        self.tag = tag
        self.title = title
        self.titleColor = titleColor
        self.link = link
        self.subTitle = subTitle
        self.detailsText = detailsText
        self.descText = descText
        self.withChevronIcon = withChevronIcon
        self.button =  button
        self.accordionLink = accordionLink
        self.tileAlignment = tileAlignment
    }
    
    var body: some View {
        VStack(alignment:tileAlignment == .centerAlignment ? .center : .leading, spacing: tileAlignment == .centerAlignment ? brandSpacing.containerSpacing.padding.s : brandSpacing.containerSpacing.padding.m) {
    
            HStack{
                if let icon =  icon {
                    icon
                }
                if tileAlignment == .leftAlignment {
                                    Spacer()
                                }
                if let tag =  tag {
                    tag
                }
            }
          
            
            if let title = title {
                Text(title)
                    .typographyStyle( brand == .de ? .h6 : .h3)
                    .foregroundColor(titleColor)
            }
            
  
            if let link = link {
                link
            }
            
      
            if let subTitle = subTitle {
                Text(subTitle)
                    .typographyStyle( brand == .de ? .h6 : .h4)
            }
            
   
            HStack{
                if let detailsText = detailsText {
                    Text(detailsText)
                        .typographyStyle(brand == .de ? .p2 : .h6)
                }
            }
            .frame(minHeight: tileAlignment == .leftAlignment ? 18 : nil )
            
            if let descText = descText {
                if let withChevronIcon = withChevronIcon, withChevronIcon {
                    HStack(alignment: .center) {
                        Text(descText)
                            .typographyStyle(brand == .de ? .p3 : .p1)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Icon(
                            iconName: "chevron_right",
                            type: .utility,
                            size: .medium,
                            color: .iconDefaultAccessible
                        )
                    }
                } else {
                    HStack(alignment: .center) {
                        Text(descText).typographyStyle(brand == .de ? .p3 : .p1)}
                
                }
            }
            
          
            if let button = button {
                    button
           
            }
           
            if let accordionLink = accordionLink {
                accordionLink
            }
        }
        .frame(maxWidth: .infinity, alignment: tileAlignment == .centerAlignment ? .center : .leading)
        .frame(minHeight: tileAlignment == .leftAlignment ? 138 : nil )
        .padding(brandSpacing.containerSpacing.padding.m)
        .background(colorToken(.pageFillGrayDefault))
        .cornerRadius(cornerRadius.s)
    }
}

