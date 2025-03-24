
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
                            h4Text: "Weekly Usage",
                            p1BoldText: "000.0 kWh | $00.00",
                            p1Text: "-$0.00 than last week last week",
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
                            h4Text: "AutoPay",
                            p1BoldText: "Scheduled",
                            p1Text: "01/01/20XX",
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
                            h4Text: "My plan",
                            p1BoldText: "90 days",
                            p1Text: "Left until contract ends (estimated)",
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
                            h4Text: "Average billing",
                            p1Text: "Sign up now",
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
                            h4Text: "Electric vehicle",
                            p1BoldText: "Charging status",
                            p1Text: "Cost to charge",
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
                            h4Text: "Nest thermostat",
                            p1BoldText: "Card details",
                            p1Text: "Link your Nest",
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
                            h4Text: "Solar",
                            p1Text: "Sync your Enphase account",
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
                            h4Text: "Rack up rewards",
                            p1BoldText: "000 points",
                            p1Text: "Earn more points",
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
                               h3Text: "$000.00 Due",
                              link:Link(
                                         text: "Pay Bill",
                                         variant: .text,
                                         isInline: false,
                                         action: {
                                             print("Standalone link tapped")
                                         }
                                     ),
                              p1Text: "Due: 01/01/20XX – AutoPay On",
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
                                           h3Text: "Solar",
                                           p1BoldText: "Home Energy",
                                           p1Text: "+4.3 kWh Daily Net",
                                           tileAlignment: .centerAlignment
                                       )
                    
                     Tile(
                                 icon: Icon(
                               iconName: "checkmark_alt",
                               type: .utility,
                               size: .medium,
                               color: .iconDefaultGreenUI
                           ),
                                       h3Text: "Thank you for signing up!",
                                 h3TextColor: colorToken(.iconDefaultGreenUI),
                                 p1Text: "  We are processing your sign up for <plan name>.  Please check your email  nrgtest1050@nrg.com for confirmation.",
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
            TilePage()
    }
}

