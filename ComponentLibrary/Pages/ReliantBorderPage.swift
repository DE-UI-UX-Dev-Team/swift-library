//
//  ReliantBorderPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/29/25.
//



import SwiftUI

struct ReliantBorderPage: View {
 
    @Environment(\.colorScheme) var colorScheme
  
    @State private var selectedBrand: String = "brandReliant"
    
    var body: some View {
        ZStack {
            VStack {
                Text("Reliant Border Page")
                    .font(.custom("Inter18pt-Light", size: 24))
                    .padding()
                
                Text("Content ")
                                .padding()
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .s,
                                                    strokeKey: .thin,
                                                    color: .black
                                                )
                    .padding()
                // button
                Button(action: {}) {
                            Text("Primary button")
                                .font(.system(size: 16, weight: .medium))
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)


                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .m,
                                                    strokeKey: .regular,
                                                    color: .black
                                                )
                        }
                
                
          
                
            }
            .navigationTitle("ReliantBorderPage")
        }
    }
}
    
    struct ReliantBorderPage_Previews: PreviewProvider {
        static var previews: some View {
            ReliantBorderPage()
        }
    }
