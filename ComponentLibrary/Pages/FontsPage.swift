//
//  FontsPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/21/25.
//

import SwiftUI

struct FontsPage: View, BrandStyleSupport{
    @State private var showToast = false
    @State private var showModal = false
    @Environment(\.colorScheme)  var colorScheme
    @Environment(\.brand) var brand
    
    var body: some View {
        ZStack {
            VStack {
                Text("Font Page")
                    .font(.custom("NRGEffraApp-Light", size: 24))
                    .padding()
                
                Text("Heading 1")
                    .typographyStyle(.h1) 
                Text("Heading 2")
                    .typographyStyle(.h2)
                Text("Heading 3")
                    .typographyStyle(.h3)
                Text("Heading 4")
                    .typographyStyle(.h4)
                Text("Heading 5")
                    .typographyStyle(.h5)
                Text("Heading 6")
                    .typographyStyle(.h6)
                
                Text("Paragraph 1")
                    .typographyStyle(.p1)
                Text("Paragraph 2")
                    .typographyStyle(.p1)
                Text("Paragraph 3")
                    .typographyStyle(.p1)
                
                Text("Link text underlined!")
                    .foregroundColor(colorToken(.primaryBase))
                    .typographyStyle(.p1)
                
                Text("Primary button text")
                    .typographyStyle(.button)
                    .foregroundColor(colorToken(.grayscale000))
                    .padding()
                    .background(colorToken(.primaryBase))
             
                
                Text("Secondary button text")
                    .typographyStyle(.button)
                    .foregroundColor(colorToken(.primaryBase))
                    .padding()
                    .background(colorToken(.primaryLightest))
               
                
                Text("Tertiary button text")
                    .typographyStyle(.button)
                    .background(colorToken(.grayscale000))
                    .foregroundColor(colorToken(.primaryBase))
                    .padding()
                    .brandBorderOverlay(radiusKey: .none, strokeKey: .regular, color: colorToken(.primaryBase))

                
                Text("Disabled button text")
                    .typographyStyle(.button)
                    .foregroundColor(colorToken(.grayscale600))
                    .padding()
                    .background(colorToken(.containerFillStatusDisabled))
            }
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

