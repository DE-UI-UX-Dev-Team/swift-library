//
//  AnotherPage.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/9/25.
//

import SwiftUI

struct AnotherPage: View {
    @State private var showToast = false
    @State private var showModal = false
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedBrand: String = "brandDE"
    
    
       private let cardItemsTwo: [(icon: String, text: String)] = [
        (icon: "xmark.circle", text: "Review your account settings before proceeding."),
        (icon: "xmark.circle", text: "Make sure your thermostat and devices are connected to power."),
        (icon: "xmark.circle", text: "Contact support if you face issues during installation.")
       ]

    var body: some View {
        ZStack {
            VStack {
                
                // Card View
                CardView(
                                    title: "Steps for Completing Your Setup",
                                    items:cardItemsTwo,
                                    iconColor: ColorToken.iconFeedbackError.color( brand: selectedBrand,
                                                                                   colorScheme: colorScheme),
                                    backgroundColor: ColorToken.containerFillSecondary4.color( brand: selectedBrand,
                                                                                               colorScheme: colorScheme)
                                )

                Button("Show Another Toast") {
                    withAnimation {
                        showToast = true
                    }
                }
                .padding()
                
         
            }
            // Toast View
            ToastView(
                message: "Complete your Vivint offer!",
                linkText: Text("Show Modal")
                    .foregroundColor(ColorToken.grayscale000.color( brand: selectedBrand,
                                                                    colorScheme: colorScheme))
                    .bold(),
                linkAction: {
                    showModal = true
                },
                image: Image("monitor"),
                backgroundColor:ColorToken.containerFillPrimary3.color( brand: selectedBrand,
                                                                        colorScheme: colorScheme),
                duration: 5.0,
                isVisible: $showToast
            )
         
        }
        .navigationTitle("AnotherPage")
        .sheet(isPresented: $showModal) {
            CustomModalView(isPresented: $showModal)
                   }
    }
}

//struct AnotherPage_Previews: PreviewProvider {
//    static var previews: some View {
//        AnotherPage()
//    }
//}
