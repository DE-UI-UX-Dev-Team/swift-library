//
//  ToastView.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/9/25.
//

import SwiftUI

struct ToastView: View {
        let message: String
        let linkText: Text
        let linkAction: () -> Void
        let image: Image
        let backgroundColor: Color
        let duration: TimeInterval
        
        @Binding var isVisible: Bool
       @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedBrand: String = "brandDE"
        
        var body: some View {
            if isVisible {
                VStack {
                    Spacer()
                    
                    HStack(spacing: 20) {
                        // Image
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 66, height: 66)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        // Text
                        VStack(alignment: .leading, spacing: 10) {
                            Text(message)
                                .foregroundColor(ColorToken.grayscale000.color( brand: selectedBrand,
                                                                                colorScheme: colorScheme))
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                            
                            // Clickable link
                            Button(action: linkAction) {
                                linkText
                            }
                        }

                        
                        // Close button
                        Button(action: {
                            withAnimation {
                                isVisible = false
                            }
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(ColorToken.grayscale000.color( brand: selectedBrand,
                                                                                colorScheme: colorScheme))
                                .padding(2)
                        }
                    }
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .shadow(radius: 5)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: isVisible)
                .onAppear {
   // Schedule hiding the toast based on `duration`
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            isVisible = false
                        }
                    }
                }
            }
        }
}
