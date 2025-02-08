//
//  ColorSwatchesPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/3/25.
//
import SwiftUI


struct ColorSwatches: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var selectedBrand: Brand = .de
    
    
    var body: some View {
        VStack(spacing: 16) {
            // Row 1
            Text("Primary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.primaryBase.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
               
                Rectangle()
                    .fill(
                        ColorToken.primaryDarkest.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.primaryLighter.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
               
            }
            
            // Row 2
            Text("Secondary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
               
                Rectangle()
                    .fill(
                        ColorToken.secondaryBase.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.secondaryLighter.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.secondaryLightest.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
            }
            // Row 3
            Text("Tertiary")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.tertiaryBase.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.tertiaryDarkest.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.tertiaryLighter.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
            }
            // Row 4
            Text("Red")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.redAccessible.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.redBase.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.redLight.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
            }
            // Row 5
            Text("Green")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.greenAccessible.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.greenBase.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.greenEco.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
            }
            // Row 6
            Text("Yellow")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.yellowAccessible.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.yellowBase.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.yellowLight.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
            }
            
            // Row 7
            Text("Grayscale")
                .font(.custom("NRGEffraApp-Light", size: 16))
            HStack(spacing: 16) {
                Rectangle()
                    .fill(
                        ColorToken.grayscale300.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.grayscale600.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(
                        ColorToken.grayscale900.color(
                            brand: selectedBrand,
                            colorScheme: colorScheme
                        )
                    )
                    .frame(width: 60, height: 60)
            }
            
        }
//        .padding()
    }
}


struct ColorSwatches_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatches()
    }
}

