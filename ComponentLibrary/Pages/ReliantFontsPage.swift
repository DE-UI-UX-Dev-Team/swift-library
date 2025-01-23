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
                Text("Custom Inter Light Black Test!")
                    .font(.custom("NRGEffraApp-Bold", size: 24))
                Text("Heading 1 Reliant Test")
                    .font(.custom("NRGEffraApp-Medium", size: 28))
                
                
                
                //Typography token system test samples for Reliant
                Text("Heading 1")
                    .TypographyStyle(.h1, colorUsage: .headingDefault, brand: selectedBrand)
                Text("Heading 2")
                    .TypographyStyle(.h2, colorUsage: .headingDefault, brand: selectedBrand)
                Text("Heading 3")
                    .TypographyStyle(.h3, colorUsage: .headingDefault, brand: selectedBrand)
                Text("Heading 4")
                    .TypographyStyle(.h4, colorUsage: .headingDefault, brand: selectedBrand)
                Text("Heading 5")
                    .TypographyStyle(.h5, colorUsage: .headingDefault, brand: selectedBrand)
                Text("Heading 6")
                    .TypographyStyle(.h6, colorUsage: .headingDefault, brand: selectedBrand)
                
                // 2. Paragraph
                Text("Paragraph 1")
                    .TypographyStyle(.p1, colorUsage: .paragraphDefault, brand: selectedBrand)
                Text("Paragraph 2")
                    .TypographyStyle(.p1, colorUsage: .paragraphDefault, brand: selectedBrand)
                Text("Paragraph 3")
                    .TypographyStyle(.p1, colorUsage: .paragraphDefault, brand: selectedBrand)
                
                // 3. Link
                Text("Link text underlined!")
                    .TypographyStyle(.link, colorUsage: .link, brand: selectedBrand)
                
   
                Text("Error message")
                    .TypographyStyle(.p2, colorUsage: .paragraphError, brand: selectedBrand)
                
                // 5. Primary button text
                Text("Primary button text")
                    .TypographyStyle(.primaryButton, colorUsage: .primaryButton, brand: selectedBrand)
                    .padding()
                    .background(ColorToken.containerFillPrimaryBrand.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                // 6. Secondary button text
                Text("Secondary button text")
                    .TypographyStyle(.secondaryButton, colorUsage: .secondaryButton, brand: selectedBrand)
                    .padding()
                    .background(ColorToken.containerFillSecondaryBrand.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                // 7. Tertiary button text
                Text("Tertiary button text")
                    .TypographyStyle(.tertiaryButton, colorUsage: .tertiaryButton, brand: selectedBrand)
                    .padding()
//                    .background(ColorToken.containerFillTertiary1.color( brand: selectedBrand,colorScheme: colorScheme))
                    .cornerRadius(8)
                // 8. Disabled button text
                Text("Disabled button text")
                    .TypographyStyle(.primaryButton, colorUsage: .disabledButton, brand: selectedBrand)
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

