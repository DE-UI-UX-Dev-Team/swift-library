//
//  ColorSwatchesPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/3/25.
//
import SwiftUI


struct ColorSwatches: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.brand) private var brand
    
    private func colorToken(_ token: ColorToken) -> Color {
            token.color(brand: brand, colorScheme: colorScheme)
        }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Primary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(colorToken(.primaryBase))
                    .frame(width: 60, height: 60)
               
                Rectangle()
                    .fill(colorToken(.primaryDarkest))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.primaryLighter))
                    .frame(width: 60, height: 60)
               
            }
            
            Text("Secondary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
               
                Rectangle()
                    .fill(colorToken(.secondaryBase))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.secondaryLighter))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.secondaryLightest))
                    .frame(width: 60, height: 60)
                
            }
            Text("Tertiary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(colorToken(.tertiaryBase))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.tertiaryDarkest))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.tertiaryLighter))
                    .frame(width: 60, height: 60)
                
            }

            Text("Red")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(colorToken(.redAccessible))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.redBase))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.redLight))
                    .frame(width: 60, height: 60)
            }

            Text("Green")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(colorToken(.greenAccessible))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.greenBase))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.greenEco))
                    .frame(width: 60, height: 60)
            }

            Text("Yellow")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(colorToken(.yellowAccessible))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.yellowBase))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.yellowLight))
                    .frame(width: 60, height: 60)
            }
            

            Text("Grayscale")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(colorToken(.grayscale300))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.grayscale600))
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(colorToken(.grayscale900))
                    .frame(width: 60, height: 60)
            }
            
        }
    }
}


struct ColorSwatches_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            ColorSwatches()
        }
    }
}

