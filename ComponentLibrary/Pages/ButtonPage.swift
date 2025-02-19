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
    @Environment(\.brand) private var brand
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 14) {
                    ButtonComponent(
                        title: "Button show toast",
                        variant: .primary
                    ) {
                        withAnimation {
                            showToast = true
                        }
                    }
                    
                    ButtonComponent(
                        title: "Button",
                        variant: .secondary
                    ) {
                        print("Secondary tapped")
                    }
                    
                    ButtonComponent(
                        title: "Button",
                        variant: .tertiary
                    ) {
                        print("Tertiary tapped")
                    }
                    
                    ButtonComponent(
                        title: "Button",
                        variant: .disabled
                    )
                    
                    ButtonComponent(
                        title: "Small Button",
                        variant: .primary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    ButtonComponent(
                        title: "Small Button",
                        variant: .secondary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    ButtonComponent(
                        title: "Small Button",
                        variant: .tertiary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    ButtonComponent(
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
                            .foregroundColor(ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)),
                        linkAction: {
                            print("Link tapped")
                        },
                        image: Image("doorbell"),
                        backgroundColor: ColorToken.grayscale800.color(brand: brand, colorScheme: colorScheme),
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
        PreviewWrapper { brand in
            ButtonView()
        }
    }
}
