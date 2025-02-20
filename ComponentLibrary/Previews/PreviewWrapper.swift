//
//  PreviewWrapper.swift
//  ComponentLibrary
//
//  Created by UX/UI Development on 2/19/25.
//


import SwiftUI

struct PreviewWrapper<Content: View>: View {
    let content: (Brand) -> Content

    var body: some View {
        ForEach(Brand.allCases, id: \.self) { brand in
            content(brand)
                .environment(\.brand, brand) 
                .previewDisplayName("\(brand)")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
