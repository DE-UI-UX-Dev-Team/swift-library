//
//  ButtonView.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/4/25.
//

import SwiftUI

struct ButtonView: View {
    @State private var showToast = false
    @Environment(\.colorScheme) var colorScheme

    @State private var selectedBrand: Brand = .reliant
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 14) {
                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Button show toast",
                        variant: .primary,
                        size: .default
                    ) {
                        withAnimation {
                            showToast = true
                        }
                    }
                    
                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Button",
                        variant: .secondary,
                        size: .default
                    ) {
                        print("Secondary tapped")
                    }
                    
                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Button",
                        variant: .tertiary,
                        size: .default
                    ) {
                        print("Tertiary tapped")
                    }
                    
                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Button",
                        variant: .disabled,
                        size: .default
                    )
                    
                    // Small-sized buttons
                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Small Button",
                        variant: .primary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Small Button",
                        variant: .secondary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Small Button",
                        variant: .tertiary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Small Button",
                        variant: .disabled,
                        size: .small
                    )
                }
                .padding()
                .frame(minHeight: geometry.size.height)
            }
            .overlay(
                VStack {
                    
                    ToastComponent(
                        message: "Complete your Vivint offer by scheduling your installation.",
                        linkText: Text("Schedule installation")
                            .font(.subheadline)
                            .foregroundColor(ColorToken.grayscale000.color(brand: selectedBrand, colorScheme: colorScheme)),
                        linkAction: {
                            print("Link tapped")
                        },
                        image: Image("doorbell"),
                        backgroundColor: ColorToken.grayscale800.color(brand: selectedBrand, colorScheme: colorScheme),
                        duration: 60.0,
                        isVisible: $showToast
                    )
                    
                    .animation(.easeInOut, value: showToast)
                }
            )
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
