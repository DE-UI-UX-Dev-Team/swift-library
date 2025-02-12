//
//  HeaderComponent.swift
//  ComponentLibrary
//
//  Created by UX/UI Development on 2/11/25.
//

import SwiftUI

struct HeaderComponent: View {
    let title: String

    var body: some View {
        HStack {
            Text(title.uppercased())
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .background(Color.blue.opacity(0.1))
    }
}
