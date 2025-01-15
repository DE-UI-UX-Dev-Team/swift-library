//
//  AnotherBrandPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/10/25.
//

import SwiftUI

struct AnotherBrandPage: View {
 
    @Environment(\.colorScheme) var colorScheme
    
    // Use Reliant brand color tokens
    @State private var selectedBrand: String = "brandReliant"
    
    
       private let cardItemsTwo: [(icon: String, text: String)] = [
        (icon: "info.circle", text: "Review your account settings before proceeding."),
        (icon: "xmark.circle", text: "Make sure your thermostat and devices are connected to power."),
        (icon: "exclamationmark.triangle", text: "Contact support if you face issues during installation.")
       ]

    var body: some View {
        ZStack {
            VStack {
                
                Text("Reliant Page")
                                .padding()
                                .padding()
                                .foregroundColor(ColorToken.secondaryBase.color( brand: selectedBrand,
                                                                                   colorScheme: colorScheme))
                                .font(.system(size: 32, weight: .heavy))
                
                //Typography token system test samples for Reliant
                Text("Heading 1")
                                .TypographyStyle(.h1, colorUsage: .headingDefault, brand: selectedBrand)
                            
                            // 2. Paragraph
                            Text("Paragraph text")
                                .TypographyStyle(.p1, colorUsage: .paragraphDefault, brand: selectedBrand)
                            
                            // 3. Link
                            Text("Link text underlined!")
                                .TypographyStyle(.link, colorUsage: .link, brand: selectedBrand)
                            
                            // 4. Error
                            Text("Error message")
                                .TypographyStyle(.p2, colorUsage: .paragraphError, brand: selectedBrand)
                            
                            // 5. Primary button text
                            Text("Primary button text")
                                .TypographyStyle(.primaryButton, colorUsage: .primaryButton, brand: selectedBrand)
                                .padding()
                                .background(ColorToken.containerFillPrimaryBrand.color( brand: selectedBrand,colorScheme: colorScheme))
                                .cornerRadius(8)
                
                // Card View
                CardView(
                                    title: "Steps for Completing Your Setup",
                                    items:cardItemsTwo,
                                    iconColor: ColorToken.tertiaryBase.color( brand: selectedBrand,colorScheme: colorScheme),
                                    backgroundColor: ColorToken.primaryBase.color( brand: selectedBrand,colorScheme: colorScheme)
                                )

                
         
            }
      
         
        }
        .navigationTitle("AnotherBrandPage")
    }
}

struct AnotherBrandPage_Previews: PreviewProvider {
    static var previews: some View {
        AnotherBrandPage()
    }
}
