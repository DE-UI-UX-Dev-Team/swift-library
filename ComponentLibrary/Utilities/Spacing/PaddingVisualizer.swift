//
//  PaddingVisualizer.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/28/25.
//

import SwiftUI

struct PaddingVisualizer: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand
    private func colorToken(_ token: ColorToken) -> Color {
        token.color(brand: brand, colorScheme: colorScheme)
    }
    let name: String
    let padding: CGFloat

    private var color: Color {
        switch name {
        case "None": return colorToken(.primaryBase).opacity(0.1)
        case "XS", "S": return colorToken(.primaryBase).opacity(0.3)
        case "M": return colorToken(.primaryBase).opacity(0.5)
        case "L", "XL": return colorToken(.primaryBase).opacity(0.7)
        case "2XL": return colorToken(.primaryBase).opacity(0.9)
        default: return colorToken(.primaryBase).opacity(0.3)
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            Text(name)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Rectangle()
                .fill(color)
                .cornerRadius(8)
                .frame(height: 50)
                .padding(padding)
                .overlay(
                    Text("\(Int(padding))")
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .bold()
                )
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.1), radius: 4)
        }
    }
}
