
import SwiftUI

enum TileAlignment {
    case leftAlignment, centerAlignment
}

struct Tile: View , BrandStyleSupport {
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme)  var colorScheme

    let icon: Icon?
    let tag: Tag?
    let h3Text: String?
    let h3TextColor: Color?
    let link: Link?
    let h4Text: String?
    let p1BoldText: String?
    let p1Text: String?
    let withChevronIcon: Bool?
    let accordionLink: Link?
    let tileAlignment: TileAlignment
    
    
    init(
        icon: Icon? = nil,
        tag: Tag? = nil,
        h3Text: String? = nil,
        h3TextColor: Color? = nil,
        link: Link? = nil,
        h4Text: String? = nil,
        p1BoldText: String? = nil,
        p1Text: String? = nil,
        withChevronIcon: Bool = false,
        accordionLink: Link? = nil,
        tileAlignment: TileAlignment
    ) {
        self.icon =  icon
        self.tag = tag
        self.h3Text = h3Text
        self.h3TextColor = h3TextColor
        self.link = link
        self.h4Text = h4Text
        self.p1BoldText = p1BoldText
        self.p1Text = p1Text
        self.withChevronIcon = withChevronIcon
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
          
            
            if let h3Text = h3Text {
                Text(h3Text)
                    .typographyStyle(.h3)
                    .foregroundColor(h3TextColor)
            }
            
  
            if let link = link {
                link
            }
            
      
            if let h4Text = h4Text {
                Text(h4Text)
                    .typographyStyle(.h4)
            }
            
   
            HStack{
                if let p1BoldText = p1BoldText {
                    Text(p1BoldText)
                        .typographyStyle(.h6)
                }
            }
            .frame(minHeight: tileAlignment == .leftAlignment ? 18 : nil )
            
            if let p1Text = p1Text {
                if let withChevronIcon = withChevronIcon, withChevronIcon {
                    HStack(alignment: .center) {
                        Text(p1Text)
                            .typographyStyle(.p1)
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
                        Text(p1Text).typographyStyle(.p1)}
                
                }
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

