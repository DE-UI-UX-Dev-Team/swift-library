
import SwiftUI


struct TilePage: View , BrandStyleSupport {
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme)  var colorScheme
    @State private var isAccordionExpandedSimple = false

        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack{
                        Tile(
                            icon: Icon(
                            iconName: "monitoring",
                            type: .utility,
                            size: .medium,
                            color: .iconDefaultGreenUI
                                   ),
                            subTitle: "Weekly Usage",
                            detailsText: "000.0 kWh | $00.00",
                            descText: "-$0.00 than last week last week",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment
                                    )
                
                        
                        Tile(
                            icon: Icon(
                            iconName: "paid",
                            type: .utility,
                            size: .medium,
                            color: .primaryBase
                      ),
                            subTitle: "AutoPay",
                            detailsText: "Scheduled",
                            descText: "01/01/20XX",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment
                        )
                   
                      
                    }
                    HStack{
                        Tile(
                            icon: Icon(
                            iconName: "article",
                            type: .utility,
                            size: .medium,
                            color: .tertiaryBase
                                   ),
                            tag: Tag(
                                text: "Time to renew",
                                style: .active(.tertiaryBase)
                            ),
                            subTitle: "My plan",
                            detailsText: "90 days",
                            descText: "Left until contract ends (estimated)",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment
                                    )
                
                        
                        Tile(
                            icon: Icon(
                            iconName: "difference",
                            type: .utility,
                            size: .medium,
                            color: .primaryBase
                      ),
                            subTitle: "Average billing",
                            descText: "Sign up now",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment
                        )
                   
                      
                    }
                    HStack{
                        Tile(
                            icon: Icon(
                            iconName: "electric_car",
                            type: .utility,
                            size: .medium,
                            color: .iconDefaultGreenUI
                                   ),
                            subTitle: "Electric vehicle",
                            detailsText: "Charging status",
                            descText: "Cost to charge",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment
                                    )
                
                        
                        Tile(
                            icon: Icon(
                            iconName: "thermostat",
                            type: .utility,
                            size: .medium,
                            color: .iconDefaultSecondary
                      ),
                            subTitle: "Nest thermostat",
                            detailsText: "Card details",
                            descText: "Link your Nest",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment
                        )
                   
                      
                    }
                    
                    HStack{
                        Tile(
                            icon: Icon(
                            iconName: "solar_power",
                            type: .utility,
                            size: .medium,
                            color: .iconDefaultSolar
                                   ),
                            subTitle: "Solar",
                            descText: "Sync your Enphase account",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment
                                    )
                
                        
                        Tile(
                            icon: Icon(
                            iconName: "stars",
                            type: .utility,
                            size: .medium,
                            color: .tertiaryBase
                      ),
                            subTitle: "Rack up rewards",
                            detailsText: "000 points",
                            descText: "Earn more points",
                            withChevronIcon:true,
                            tileAlignment: .leftAlignment
                        )
                      
                    }
                    

                    
                    
                        Tile(
                                     icon: Icon(
                                   iconName: "request_quote",
                                   type: .utility,
                                   size: .medium,
                                   color: .primaryBase
                               ),
                               title: "$000.00 Due",
                              link:Link(
                                         text: "Pay Bill",
                                         variant: .text,
                                         isInline: false,
                                         action: {
                                             print("Standalone link tapped")
                                         }
                                     ),
                              descText: "Due: 01/01/20XX – AutoPay On",
                            accordionLink: Link(
                                         text: "View bill details",
                                         variant: .accordion(isExpanded: isAccordionExpandedSimple),
                                         isInline: false,
                                         action: {
                                             withAnimation {
                                                 isAccordionExpandedSimple.toggle()
                                             }
                                             print("Accordion link tapped, isExpanded = \(isAccordionExpandedSimple)")
                                         }
                                     ),
                               tileAlignment: .centerAlignment
                                       )
                      
                                       
                            Tile(
                                           icon: Icon(
                                            iconName: "solar_power",
                                            type: .utility,
                                            size: .medium,
                                            color: .iconDefaultSolar
                                                   ),
                                           title: "Solar",
                                           detailsText: "Home Energy",
                                           descText: "+4.3 kWh Daily Net",
                                           tileAlignment: .centerAlignment
                                       )
                    
                     Tile(
                                 icon: Icon(
                               iconName: "checkmark_alt",
                               type: .utility,
                               size: .medium,
                               color: .iconDefaultGreenUI
                           ),
                                       title: "Thank you for signing up!",
                                 titleColor: colorToken(.iconDefaultGreenUI),
                                 descText: "  We are processing your sign up for <plan name>.  Please check your email  nrgtest1050@nrg.com for confirmation.",
                                 tileAlignment: .centerAlignment
                                   )
                   
                }
                .padding(16)
                .background(colorToken(.pageFillGray2))
          
            }
        }
}

struct TilePage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            TilePage()
        }
    }
}

