//
//  ReliantBorderPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/29/25.
//



import SwiftUI

struct BorderPage: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand

    
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
                                                    brand: brand,
                                                    radiusKey: .none,
                                                    strokeKey: .none,
                                                    color:ColorToken.primaryBase.color( brand: brand,colorScheme: colorScheme) )
                
                Text("Thin")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .none,
                                                    strokeKey: .thin,
                                                    color:ColorToken.tertiaryBase.color( brand: brand,colorScheme: colorScheme) )
                Text("Regular")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .none,
                                                    strokeKey: .regular,
                                                    color:ColorToken.tertiaryBase.color( brand: brand,colorScheme: colorScheme) )
                Text("Thick")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .none,
                                                    strokeKey: .thick,
                                                    color:ColorToken.tertiaryBase.color( brand: brand,colorScheme: colorScheme) )
                Text("Bar")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .none,
                                                    strokeKey: .bar,
                                                    color:ColorToken.tertiaryBase.color( brand: brand,colorScheme: colorScheme) )
                
                Text("Border Radius")
                    .font(.custom("Inter18pt-Bold", size: 18))
                    .padding()
                Text("None")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .none,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: brand,colorScheme: colorScheme) )
                Text("XS")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .xs,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: brand,colorScheme: colorScheme) )
                Text("S")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .s,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: brand,colorScheme: colorScheme) )
                Text("M")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .m,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: brand,colorScheme: colorScheme) )
                Text("Full")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    brand: brand,
                                                    radiusKey: .full,
                                                    strokeKey: .thick,
                                                    color:ColorToken.secondaryBase.color( brand: brand,colorScheme: colorScheme) )
            }
            .navigationTitle("ReliantBorderPage")
        }
    }
}
    
    struct BorderPage_Previews: PreviewProvider {
        static var previews: some View {
            PreviewWrapper { brand in
                BorderPage()}
        }
    }
