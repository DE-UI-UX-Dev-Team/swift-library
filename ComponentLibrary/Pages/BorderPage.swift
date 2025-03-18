//
//  BorderPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/29/25.
//



import SwiftUI

struct BorderPage: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand)  var brand

    
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
                                                    radiusKey: .none,
                                                    strokeKey: .none,
                                                    color:colorToken(.primaryBase))
                
                Text("Thin")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                   
                                                    radiusKey: .none,
                                                    strokeKey: .thin,
                                                    color:colorToken(.tertiaryBase))
                Text("Regular")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                   
                                                    radiusKey: .none,
                                                    strokeKey: .regular,
                                                    color:colorToken(.tertiaryBase) )
                Text("Thick")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    
                                                    radiusKey: .none,
                                                    strokeKey: .thick,
                                                    color:colorToken(.tertiaryBase) )
                Text("Bar")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    radiusKey: .none,
                                                    strokeKey: .bar,
                                                    color:colorToken(.tertiaryBase) )
                
                Text("Border Radius")
                    .font(.custom("Inter18pt-Bold", size: 18))
                    .padding()
                Text("None")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                   
                                                    radiusKey: .none,
                                                    strokeKey: .thick,
                                                    color:colorToken(.secondaryBase) )
                Text("XS")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                    
                                                    radiusKey: .xs,
                                                    strokeKey: .thick,
                                                    color:colorToken(.secondaryBase) )
                Text("S")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                   
                                                    radiusKey: .s,
                                                    strokeKey: .thick,
                                                    color:colorToken(.secondaryBase) )
                Text("M")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                   
                                                    radiusKey: .m,
                                                    strokeKey: .thick,
                                                    color:colorToken(.secondaryBase) )
                Text("Full")
                    .padding(.vertical, 8)
                        .padding(.horizontal, 65)
                                .brandBorderOverlay(
                                                  
                                                    radiusKey: .full,
                                                    strokeKey: .thick,
                                                    color:colorToken(.secondaryBase) )
            }
        }
    }
}
    
    struct BorderPage_Previews: PreviewProvider {
        static var previews: some View {
            PreviewWrapper { brand in
                BorderPage()}
        }
    }
