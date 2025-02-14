//
//  ReliantBorderPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/29/25.
//



import SwiftUI

struct ReliantBorderPage: View {
 
    @Environment(\.colorScheme) var colorScheme
  
    @State private var selectedBrand: Brand = .de
    
    var body: some View {
        ZStack {
            VStack {
                Text("Border Page")
                    .font(.custom("Inter18pt-Regular", size: 24))
                    .padding()
                Text("Border Stroke")
                    .font(.custom("Inter18pt-Bold", size: 18))
                    .padding()
                
                Text("None")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .none,
                                                    strokeKey: .none,
                                                    color:ColorToken.primaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                
                Text("Thin")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .none,
                                                    strokeKey: .thin,
                                                    color:ColorToken.tertiaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                Text("Regular")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .none,
                                                    strokeKey: .regular,
                                                    color:ColorToken.tertiaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                Text("Thick")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .none,
                                                    strokeKey: .thick,
                                                    color:ColorToken.tertiaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                Text("Bar")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .none,
                                                    strokeKey: .bar,
                                                    color:ColorToken.tertiaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                
                Text("Border Radius")
                    .font(.custom("Inter18pt-Bold", size: 18))
                    .padding()
                Text("None")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .none,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                Text("XS")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .xs,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                Text("S")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .s,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                Text("None")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .m,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                Text("Full")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: selectedBrand,
                                                    radiusKey: .full,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
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
