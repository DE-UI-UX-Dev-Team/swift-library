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
        @State private var selectedBrand: Brand = .de

        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Standalone Link:")
                        .typographyStyle(.h3,  brand: selectedBrand)
                    LinkComponent(
                        selectedBrand: selectedBrand,
                        text: "Tap Me (Standalone)",
                        variant: .text,
                        isInline: false,
                        action: {
                            print("Standalone link tapped")
                        }
                    )
                    
                    Divider()
                    
                    Text("Inline Link:")
                        .typographyStyle(.h3,  brand: selectedBrand)
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("This is an ")
                        LinkComponent(
                            selectedBrand: selectedBrand,
                            text: "inline link",
                            variant: .text,
                            isInline: true,
                            action: {
                                print("Inline link tapped")
                            }
                        )
                        Text(" embedded.")
                    }.typographyStyle(.p1, brand: selectedBrand)
                    
                    Divider()
                    
                    Text("Accordion Link (No Extra Content):")
                        .typographyStyle(.h3,  brand: selectedBrand)
                    LinkComponent(
                        selectedBrand: selectedBrand,
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
                        .typographyStyle(.h3,  brand: selectedBrand)
                    VStack(alignment: .leading, spacing: 8) {
                        LinkComponent(
                            selectedBrand: selectedBrand,
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
                                .typographyStyle(.p1,  brand: selectedBrand)
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
        LinkPage()
    }
}

