//
//  SpacingPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/25/25.
//


import SwiftUI


struct SpacingPage: View {
    @Environment(\.brand) private var brand
    
    private var brandSpacing: BrandSpacing {
        SpacingTokenManager.shared.spacing(for: brand)
    }

    var body: some View {
        ScrollView {
            VStack() {
                ContainerSpacingVisualizer(spacing: brandSpacing.containerSpacing)            }
            .pageMargins()
            .frame(maxHeight: PageMaxHeights.heightForDevice())
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




