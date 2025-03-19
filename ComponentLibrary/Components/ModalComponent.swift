//
//  ModalView.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//

import SwiftUI

struct Modal: View {
    @Binding var isPresented: Bool 

    var body: some View {
        ZStack {
                        Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)

            VStack {
                Text("This is a modal")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                SwiftUI.Button("Close Modal") {
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
