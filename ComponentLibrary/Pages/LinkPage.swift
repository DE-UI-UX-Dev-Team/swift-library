//
//  LinkPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/6/25.
//
import SwiftUI

struct LinkPage: View {
        @State private var isAccordionExpandedSimple = false
        @State private var isAccordionExpandedWithContent = false
    @Environment(\.brand) private var brand

        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Standalone Link:")
                        .typographyStyle(.h3,  brand: brand)
                    LinkComponent(
                        text: "Tap Me (Standalone)",
                        variant: .text,
                        isInline: false,
                        action: {
                            print("Standalone link tapped")
                        }
                    )
                    
                    Divider()
                    
                    Text("Inline Link:")
                        .typographyStyle(.h3,  brand: brand)
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("This is an ")
                        LinkComponent(
                            text: "inline link",
                            variant: .text,
                            isInline: true,
                            action: {
                                print("Inline link tapped")
                            }
                        )
                        Text(" embedded.")
                    }.typographyStyle(.p1, brand: brand)
                    
                    Divider()
                    
                    Text("Accordion Link (No Extra Content):")
                        .typographyStyle(.h3,  brand: brand)
                    LinkComponent(

                        text: "Toggle Accordion",
                        variant: .accordion(isExpanded: isAccordionExpandedSimple),
                        isInline: false,
                        action: {
                            withAnimation {
                                isAccordionExpandedSimple.toggle()
                            }
                            print("Accordion link tapped, isExpanded = \(isAccordionExpandedSimple)")
                        }
                    )
                    
                    Divider()
                    
                    Text("Accordion Link (With Additional Content):")
                        .typographyStyle(.h3,  brand: brand)
                    VStack(alignment: .leading, spacing: 8) {
                        LinkComponent( 
                            text: "Show/Hide Details",
                            variant: .accordion(isExpanded: isAccordionExpandedWithContent),
                            isInline: false,
                            action: {
                                withAnimation {
                                    isAccordionExpandedWithContent.toggle()
                                }
                            }
                        )
                        if isAccordionExpandedWithContent {
                            Text("Here is some extra content revealed by the accordion link. It could be any view!")
                                .typographyStyle(.p1,  brand: brand)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .transition(.opacity)
                        }
                    }
                }
                .padding(EdgeInsets(top: 44, leading: 16, bottom: 24, trailing: 16))
            }
        }
}

struct LinkPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            LinkPage()
        }
    }
}

