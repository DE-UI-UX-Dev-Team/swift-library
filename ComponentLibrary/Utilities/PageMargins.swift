//
//  PageMarginModifier.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/28/25.
//

import SwiftUI

struct PageMarginModifier: ViewModifier, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
    
    
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
