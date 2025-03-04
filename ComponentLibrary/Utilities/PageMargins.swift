//
//  PageMarginModifier.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/28/25.
//

import SwiftUI

struct PageMarginModifier: ViewModifier {
    @Environment(\.brand) private var brand
    
    private var brandSpacing: BrandSpacing {
        SpacingTokenManager.shared.spacing(for: brand)
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.top, brandSpacing.pageLayout.margins.top)
            .padding(.horizontal, brandSpacing.pageLayout.margins.horizontal)
            .padding(.bottom, brandSpacing.pageLayout.margins.bottom)
    }
}

extension View {
    func pageMargins() -> some View {
        self.modifier(PageMarginModifier())
    }
}
