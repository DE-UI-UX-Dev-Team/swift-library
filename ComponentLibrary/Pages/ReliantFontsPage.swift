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
    
    @State private var selectedBrand: Brand = .reliant

    
    var body: some View {
        ZStack {
            VStack {
                Text("Font Page")
                    .font(.custom("NRGEffraApp-Light", size: 24))
                    .padding()
                
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
                
//                Text("link")
//                    .typographyStyle(.link, brand: selectedBrand)
                // Inline Link
                Text("Link text underlined!").foregroundColor(ColorToken.primaryBase.color( brand: selectedBrand, colorScheme: colorScheme)).typographyStyle(.p1, brand: selectedBrand)
                
                Text("Primary button text").typographyStyle(.primaryButton,brand: selectedBrand).foregroundColor(ColorToken.grayscale000.color(brand: selectedBrand, colorScheme: colorScheme)).padding().background(ColorToken.primaryBase.color( brand: selectedBrand,colorScheme: colorScheme))
                Text("Secondary button text").typographyStyle(.secondaryButton, brand: selectedBrand).foregroundColor(ColorToken.primaryBase.color(brand: selectedBrand, colorScheme: colorScheme)).padding().background(ColorToken.primaryLightest.color( brand: selectedBrand,colorScheme: colorScheme))
                Text("Tertiary button text").typographyStyle(.tertiaryButton,brand: selectedBrand).background(ColorToken.grayscale000.color( brand: selectedBrand,colorScheme: colorScheme)).foregroundColor(ColorToken.primaryBase.color(brand: selectedBrand, colorScheme: colorScheme)).padding().brandBorderOverlay(brand: selectedBrand,radiusKey: .none,strokeKey: .regular,color: ColorToken.primaryBase.color( brand: selectedBrand, colorScheme: colorScheme))
                Text("Disabled button text").typographyStyle(.primaryButton,brand: selectedBrand).foregroundColor(ColorToken.grayscale600.color(brand: selectedBrand, colorScheme: colorScheme)).padding() .background(ColorToken.containerFillStatusDisabled.color( brand: selectedBrand,colorScheme: colorScheme))
                
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

