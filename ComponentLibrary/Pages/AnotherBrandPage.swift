//
//  AnotherBrandPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/10/25.
//

import SwiftUI

struct AnotherBrandPage: View {
 
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedBrand: Brand = .reliant
    
    
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
                
                Text("Heading 1")
                                .typographyStyle(.h1,  brand: selectedBrand)
                            

                Text("Paragraph text")
                                .typographyStyle(.p1,  brand: selectedBrand)

                Text("Link text underlined!")
                            .foregroundColor(ColorToken.primaryBase.color( brand: selectedBrand,
                                                                             colorScheme: colorScheme))
                            .typographyStyle(.p1, brand: selectedBrand)
                            

                            Text("Primary button text")
                                .typographyStyle(.primaryButton, brand: selectedBrand)
                                .padding()
                                .background(ColorToken.containerFillPrimaryBrand.color( brand: selectedBrand,colorScheme: colorScheme))
                                .cornerRadius(8)
                
                CardComponent(
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
