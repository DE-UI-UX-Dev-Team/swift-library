//
//  AnotherBrandPage.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/10/25.
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
                
                // Card View
                CardView(
                                    title: "Steps for Completing Your Setup",
                                    items:cardItemsTwo,
                                    iconColor: ColorToken.tertiaryBase.color( brand: selectedBrand,
                                                                                   colorScheme: colorScheme),
                                    backgroundColor: ColorToken.primaryBase.color( brand: selectedBrand,
                                                                                               colorScheme: colorScheme)
                                )

                
         
            }
      
         
        }
        .navigationTitle("AnotherBrandPage")
    }
}

//struct AnotherBrandPage_Previews: PreviewProvider {
//    static var previews: some View {
//        AnotherBrandPage()
//    }
//}
