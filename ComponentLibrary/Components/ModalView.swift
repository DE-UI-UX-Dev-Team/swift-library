//
//  ModalView.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/9/25.
//

import SwiftUI

struct CustomModalView: View {
    @Binding var isPresented: Bool // Binding to close the modal

    var body: some View {
        ZStack {
                        Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)

            VStack {
                Text("This is a modal")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                Button("Close Modal") {
                    isPresented = false
                }
                .padding()
                .background(Color.white)
                .foregroundColor(.green)
                .cornerRadius(10)
            }
        }
    }
}
