//
//  Untitled.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//

import SwiftUI

struct CardComponent: View {
    let title: String
    let items: [(icon: String, text: String)]
    let iconColor: Color
    let backgroundColor: Color
    
    @Environment(\.colorScheme) var colorScheme
    

    @State private var selectedBrand: Brand = .de

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(ColorToken.grayscale900.color( brand: selectedBrand,
                                                                colorScheme: colorScheme))

            // List of items
            ForEach(items, id: \.text) { item in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: item.icon)
                        .foregroundColor(iconColor)
                        .font(.title2)

                    Text(item.text)
                        .font(.body)
                        .foregroundColor(ColorToken.grayscale900.color( brand: selectedBrand,
                                                                        colorScheme: colorScheme))
                }
                .padding(.bottom, 8)
                .frame(maxWidth: .infinity, alignment: .leading)

                Divider()
            }
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 4)
        .padding(.horizontal, 16)
    }
}
