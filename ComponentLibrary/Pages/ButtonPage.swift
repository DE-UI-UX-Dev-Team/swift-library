//
//  ButtonView.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/4/25.
//

import SwiftUI

struct ButtonView: View, BrandStyleSupport {
    @State private var showToast = false
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 14) {
                    Button(
                        title: "Button show toast",
                        variant: .primary
                    ) {
                        withAnimation {
                            showToast = true
                        }
                    }
                    
                    Button(
                        title: "Button",
                        variant: .secondary
                    ) {
                        print("Secondary tapped")
                    }
                    
                    Button(
                        title: "Button",
                        variant: .tertiary
                    ) {
                        print("Tertiary tapped")
                    }
                    
                    Button(
                        title: "Button",
                        variant: .disabled
                    )
                    
                    Button(
                        title: "Small Button",
                        variant: .primary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    Button(
                        title: "Small Button",
                        variant: .secondary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    Button(
                        title: "Small Button",
                        variant: .tertiary,
                        size: .small
                    ) {
                        print("Small Primary tapped")
                    }
                    
                    Button(
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
                    
                    Toast(
                        message: "Complete your Vivint offer by scheduling your installation.",
                        linkText: Text("Schedule installation")
                            .font(.subheadline)
                            .foregroundColor(colorToken(.grayscale000)),
                        linkAction: {
                            print("Link tapped")
                        },
                        image: Image("doorbell"),
                        backgroundColor:colorToken(.grayscale800),
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
