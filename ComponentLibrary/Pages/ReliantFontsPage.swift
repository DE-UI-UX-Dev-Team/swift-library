//
//  ReliantFontsPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/21/25.
//

import SwiftUI

struct ReliantFontsPage: View {
    @State private var showToast = false
    @State private var showModal = false
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedBrand: String = "brandReliant"
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("Reliant fonts Page")
                    .font(.custom("NRGEffraApp-Light", size: 24))
                    .padding()
                Text("Custom Effra Light Black Test!")
                    .font(.custom("NRGEffraApp-Bold", size: 24))
                Text("Heading 1 Reliant Test")
                    .font(.custom("NRGEffraApp-Medium", size: 28))
                
                
                
                // Typography token system test samples for Reliant
                Text("Heading 1")
                    .typographyStyle(.h1,  brand: selectedBrand)
                Text("Heading 2")
                    .typographyStyle(.h2,  brand: selectedBrand)
                Text("Heading 3")
                    .typographyStyle(.h3,  brand: selectedBrand)
                Text("Heading 4")
                    .typographyStyle(.h4,  brand: selectedBrand)
                Text("Heading 5")
                    .typographyStyle(.h5,  brand: selectedBrand)
                Text("Heading 6")
                    .typographyStyle(.h6,  brand: selectedBrand)
                
                // Paragraph
                Text("Paragraph 1")
                    .typographyStyle(.p1,  brand: selectedBrand)
                Text("Paragraph 2")
                    .typographyStyle(.p1,  brand: selectedBrand)
                Text("Paragraph 3")
                    .typographyStyle(.p1, brand: selectedBrand)
                
                // Inline Link
                Text("Link text underlined!")
                            .foregroundColor(ColorToken.primaryBase.color( brand: selectedBrand,
                                                                             colorScheme: colorScheme))
                            .typographyStyle(.p1, brand: selectedBrand)
                
                // Primary button text
                Text("Primary button text")
                    .typographyStyle(.primaryButton,  brand: selectedBrand)
                    .padding()
                    .background(ColorToken.containerFillPrimaryBrand.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                // Secondary button text
                Text("Secondary button text")
                    .typographyStyle(.secondaryButton, brand: selectedBrand)
                    .padding()
                    .background(ColorToken.containerFillSecondaryBrand.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                // Tertiary button text
                Text("Tertiary button text")
                    .typographyStyle(.tertiaryButton,  brand: selectedBrand)
                    .padding()
                    .cornerRadius(8)
                // 8. Disabled button text
                Text("Disabled button text")
                    .typographyStyle(.primaryButton,  brand: selectedBrand)
                    .padding()
                    .background(ColorToken.containerFillStatusDisabled.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                
            }
            .navigationTitle("ReliantFontsPage")
        }
    }
}
    
    struct ReliantFontsPage_Previews: PreviewProvider {
        static var previews: some View {
            ReliantFontsPage()
        }
    }

