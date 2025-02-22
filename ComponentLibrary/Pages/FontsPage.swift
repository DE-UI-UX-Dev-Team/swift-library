//
//  ReliantFontsPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/21/25.
//

import SwiftUI

struct FontsPage: View {
    @State private var showToast = false
    @State private var showModal = false
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand
    

    
    var body: some View {
        ZStack {
            VStack {
                Text("Font Page")
                    .font(.custom("NRGEffraApp-Light", size: 24))
                    .padding()
                
                Text("Heading 1")
                    .typographyStyle(.h1,  brand: brand)
                Text("Heading 2")
                    .typographyStyle(.h2,  brand: brand)
                Text("Heading 3")
                    .typographyStyle(.h3,  brand: brand)
                Text("Heading 4")
                    .typographyStyle(.h4,  brand: brand)
                Text("Heading 5")
                    .typographyStyle(.h5,  brand: brand)
                Text("Heading 6")
                    .typographyStyle(.h6,  brand: brand)
                

                Text("Paragraph 1")
                    .typographyStyle(.p1,  brand: brand)
                Text("Paragraph 2")
                    .typographyStyle(.p1,  brand: brand)
                Text("Paragraph 3")
                    .typographyStyle(.p1, brand: brand)
                

                Text("Link text underlined!").foregroundColor(ColorToken.primaryBase.color( brand: brand, colorScheme: colorScheme)).typographyStyle(.p1, brand: brand)
                
                Text("Primary button text").typographyStyle(.button,brand: brand).foregroundColor(ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)).padding().background(ColorToken.primaryBase.color( brand: brand,colorScheme: colorScheme))
                Text("Secondary button text").typographyStyle(.button, brand: brand).foregroundColor(ColorToken.primaryBase.color(brand: brand, colorScheme: colorScheme)).padding().background(ColorToken.primaryLightest.color( brand: brand,colorScheme: colorScheme))
                Text("Tertiary button text").typographyStyle(.button,brand: brand).background(ColorToken.grayscale000.color( brand: brand,colorScheme: colorScheme)).foregroundColor(ColorToken.primaryBase.color(brand: brand, colorScheme: colorScheme)).padding().brandBorderOverlay(brand: brand,radiusKey: .none,strokeKey: .regular,color: ColorToken.primaryBase.color( brand: brand, colorScheme: colorScheme))
                Text("Disabled button text").typographyStyle(.button,brand: brand).foregroundColor(ColorToken.grayscale600.color(brand: brand, colorScheme: colorScheme)).padding() .background(ColorToken.containerFillStatusDisabled.color( brand: brand,colorScheme: colorScheme))
                
            }
            .navigationTitle("ReliantFontsPage")
        }
    }
}
    
    struct FontsPage_Previews: PreviewProvider {
        static var previews: some View {
            PreviewWrapper { brand in
                FontsPage()
            }
        }
    }

