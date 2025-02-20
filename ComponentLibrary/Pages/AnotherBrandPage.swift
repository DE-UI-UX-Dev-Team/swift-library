//
//  AnotherBrandPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/10/25.
//

import SwiftUI

struct AnotherBrandPage: View {
 
    @Environment(\.colorScheme) var colorScheme

    @Environment(\.brand) private var brand

    
    
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
                                .foregroundColor(ColorToken.secondaryBase.color( brand: brand,
                                                                                   colorScheme: colorScheme))
                                .font(.system(size: 32, weight: .heavy))
                
                Text("Heading 1")
                                .typographyStyle(.h1,  brand: brand)
                            

                Text("Paragraph text")
                                .typographyStyle(.p1,  brand: brand)

                Text("Link text underlined!")
                            .foregroundColor(ColorToken.primaryBase.color( brand: brand,
                                                                             colorScheme: colorScheme))
                            .typographyStyle(.p1, brand: brand)
                            

                            Text("Primary button text")
                                .typographyStyle(.primaryButton, brand: brand)
                                .padding()
                                .background(ColorToken.containerFillPrimaryBrand.color( brand: brand,colorScheme: colorScheme))
                                .cornerRadius(8)
                
                CardComponent(
                                    title: "Steps for Completing Your Setup",
                                    items:cardItemsTwo,
                                    iconColor: ColorToken.tertiaryBase.color( brand: brand,colorScheme: colorScheme),
                                    backgroundColor: ColorToken.primaryBase.color( brand: brand,colorScheme: colorScheme)
                                )

                
         
            }
      
         
        }
        .navigationTitle("AnotherBrandPage")
    }
}

struct AnotherBrandPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            AnotherBrandPage()
        }
    }
}
