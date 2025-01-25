//
//  DeFontsPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/21/25.
//

import SwiftUI

struct DeFontsPage: View {
    @State private var showToast = false
    @State private var showModal = false
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedBrand: String = "brandDE"
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("DE fonts Page")
                    .font(.custom("Inter18pt-Light", size: 24))
                    .padding()
                Text("Custom Basic Sans Light Black Test!")
                    .font(.custom("BasicSans-Light", size: 24))
                Text("Test Heading 1")
                    .font(.custom("BasicSans-Bold", size: 28))
                
                    .padding()
                
                //Typography token system test samples for Reliant
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
                   .typographyStyle(.p1, brand: selectedBrand)
                Text("Paragraph 2")
                   .typographyStyle(.p1, brand: selectedBrand)
                Text("Paragraph 3")
                   .typographyStyle(.p1, brand: selectedBrand)
                
          
            
                
//                 In-line Link
                Text("Link text underlined!")
                            .underline()
                            .foregroundColor(ColorToken.primaryDarkest.color( brand: selectedBrand,
                                                                             colorScheme: colorScheme))
                            .typographyStyle(.p2, brand: selectedBrand)
                

               
                // Primary button text
                Text("Primary button text")
                   .typographyStyle(.primaryButton,  brand: selectedBrand)
                    .padding()
                    .background(ColorToken.containerFillTertiary1.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                // Secondary button text
                Text("Secondary button text")
                   .typographyStyle(.secondaryButton, brand: selectedBrand)
                    .padding()
                    .background(ColorToken.containerFillSecondaryBrand.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                // Tertiary button text
                Text("Tertiary button text")
                   .typographyStyle(.tertiaryButton, brand: selectedBrand)
                    .padding()

                    .cornerRadius(8)
                // Disabled button text
                Text("Disabled button text")
                   .typographyStyle(.primaryButton, brand: selectedBrand)
                    .padding()
                    .background(ColorToken.containerFillStatusDisabled.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                
            }
            .navigationTitle("DeFontsPage")
        }
    }
}
    
    struct DeFontsPage_Previews: PreviewProvider {
        static var previews: some View {
            DeFontsPage()
        }
    }

