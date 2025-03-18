//
//  SpacingPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/25/25.
//


import SwiftUI


struct SpacingPage: View, BrandStyleSupport {
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme) var colorScheme


    var body: some View {
        ScrollView {
            VStack() {
                ContainerSpacingVisualizer(spacing: brandSpacing.containerSpacing)            }
            .pageMargins()
            .border(Color.red, width: 2)
        }
    }
}
struct SpacingPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            SpacingPage()
        }
    }
}




