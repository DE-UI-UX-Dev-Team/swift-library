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
    
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Primary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.primaryBase.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
               
                Rectangle()
                    .fill(
                        ColorToken.primaryDarkest.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.primaryLighter.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
               
            }
            
            Text("Secondary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
               
                Rectangle()
                    .fill(
                        ColorToken.secondaryBase.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.secondaryLighter.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.secondaryLightest.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
            }
            Text("Tertiary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.tertiaryBase.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.tertiaryDarkest.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.tertiaryLighter.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
            }

            Text("Red")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.redAccessible.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.redBase.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.redLight.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
            }

            Text("Green")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.greenAccessible.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.greenBase.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.greenEco.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
            }

            Text("Yellow")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.yellowAccessible.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.yellowBase.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.yellowLight.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
            }
            

            Text("Grayscale")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.grayscale300.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.grayscale600.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.grayscale900.color(
                            brand: brand,
                            colorScheme: colorScheme
                        )
                    )
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

