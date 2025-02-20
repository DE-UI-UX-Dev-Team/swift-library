//
//  InputComponent.swift
//  ComponentLibrary
//
//  Created by susan ruan on 2/18/25.
//

import SwiftUI
//.buttonStyle(PlainButtonStyle())


// MARK: - 1) InputVariant
enum InputVariant: CaseIterable {
    case radio
    case checkbox
}

// MARK: - 2) InputState
enum InputState {
    case normal
    case selected
    case disabled
    case error
}

// MARK: - 5) InputOption
struct InputOption: Identifiable {
    let id = UUID()
    let label: String
    let value: String
}



 // MARK: - 9) InputComponent
struct InputComponent: View {
    @Environment(\.colorScheme) var colorScheme
    let selectedBrand: Brand
    let variant: InputVariant
    @Binding var value: String
    var options: [InputOption]
    var label: String? = nil
    var hasError: Bool = false
    var isDisabled: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            if let label = label {
                Text(label)
                    .typographyStyle(.p2, brand: selectedBrand)
                    .foregroundColor(
                        isDisabled
                            ? ColorToken.grayscale500.color(brand: selectedBrand, colorScheme: colorScheme)
                            : ColorToken.grayscale900.color(brand: selectedBrand, colorScheme: colorScheme)
                    )
            }
            
            switch variant {
            case .checkbox:
                ForEach(options) { option in
                    let selectedValues = value.split(separator: ",").map(String.init)
                    let isSelected = selectedValues.contains(option.value)
                    
                    Button(action: {
                        guard !isDisabled else { return }
                        var newValues = Set(selectedValues)
                        if isSelected {
                            newValues.remove(option.value)
                        } else {
                            newValues.insert(option.value)
                        }
                        value = newValues.joined(separator: ",")
                    }) {
                        HStack {
                            // CUSTOM CHECKBOX
                            CustomCheckbox(
                                isSelected: isSelected,
                                isDisabled: isDisabled,
                                isError: hasError,
                                size: 24,
                                brand: selectedBrand,
                                colorScheme: colorScheme
                            )
                            
                            Text(option.label)
                                .foregroundColor(isDisabled ? .gray : .black)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(isDisabled)
                }
                
            case .radio:
                ForEach(options) { option in
                    let isSelected = (value == option.value)
                    
                    Button(action: {
                        guard !isDisabled else { return }
                        value = option.value
                    }) {
                        HStack {
                            // CUSTOM RADIO
                            CustomRadioButton(
                                isSelected: isSelected,
                                isDisabled: isDisabled,
                                isError: hasError,  // Updated to use hasError
                                size: 24,
                                brand: selectedBrand,
                                colorScheme: colorScheme
                            )
                            
                            Text(option.label)
                                .foregroundColor(isDisabled ? .gray : .black)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(isDisabled)
                }
            }
        }
        .padding(8)
    }
}


// custom-colored radio button and checkbox

struct CustomCheckbox: View {
    var isSelected: Bool
    var isDisabled: Bool
    var isError: Bool
    var size: CGFloat = 18

    var brand: Brand
    var colorScheme: ColorScheme

    var body: some View {
        let colors = checkboxColors(
            isSelected: isSelected,
            isDisabled: isDisabled,
            isError: isError,
            brand: brand,
            colorScheme: colorScheme
        )
        
        ZStack {
            // 1) Outer square (border)
            RoundedRectangle(cornerRadius: 4)
                .strokeBorder(colors.border, lineWidth: 3)
                .frame(width: size, height: size)

            // 2) Inner fill
            RoundedRectangle(cornerRadius: 2)
                .fill(colors.fill)
                .frame(width: size * 0.8, height: size * 0.8)

            // 3) Checkmark if selected
            if isSelected {
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size * 0.5, height: size * 0.5)
                    .foregroundColor(colors.check)
                    .font(.system(size: size * 0.5, weight: .black))
            }
        }
    }
    
    // MARK: - Decide colors for each state combination
    private func checkboxColors(
        isSelected: Bool,
        isDisabled: Bool,
        isError: Bool,
        brand: Brand,
        colorScheme: ColorScheme
    ) -> (border: Color, fill: Color, check: Color) {
        
        switch (isDisabled, isError, isSelected) {
        // DISABLED + UNSELECTED
        case (true, _, false):
            return (
                border: ColorToken.grayscale500.color(brand: brand, colorScheme: colorScheme),
                fill:   ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme),
                check:  .clear
            )
        // DISABLED + SELECTED
        case (true, _, true):
            return (
                border: ColorToken.grayscale500.color(brand: brand, colorScheme: colorScheme),
                fill:   ColorToken.grayscale500.color(brand: brand, colorScheme: colorScheme),
                check:  ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
            )
            
        // ERROR + UNSELECTED
        case (_, true, false):
            return (
                border: ColorToken.redAccessible.color(brand: brand, colorScheme: colorScheme),
                fill:    ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme),
                check:   ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
            )
        // ERROR + SELECTED
        case (_, true, true):
            let fill = (brand == .de)
        ? ColorToken.redLight.color(brand: brand, colorScheme: colorScheme)
        : ColorToken.redAccessible.color(brand: brand, colorScheme: colorScheme)
            let check = (brand == .de)
        ? ColorToken.redAccessible.color(brand: brand, colorScheme: colorScheme)
        : ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
            return (
                border: ColorToken.redAccessible.color(brand: brand, colorScheme: colorScheme),fill,check)
            
        // NORMAL + UNSELECTED
        case (_, _, false):
            let border = (brand == .de)
                ? ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme)
                : ColorToken.grayscale700.color(brand: brand, colorScheme: colorScheme)
            return (border,ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme) , .clear)
        // NORMAL + SELECTED
        case (_, _, true):
                // Normal & selected:
                let fill = (brand == .de)
                    ? ColorToken.primaryLighter.color(brand: brand, colorScheme: colorScheme)
                    : ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme)
            let check = (brand == .de)
                ? ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme)
                : ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
                return (ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme), fill, check)
        }
    }
}


struct CustomRadioButton: View {
    // States
    var isSelected: Bool
    var isDisabled: Bool
    var isError: Bool

    // Sizing
    var size: CGFloat = 20

    // Brand + color scheme
    var brand: Brand
    var colorScheme: ColorScheme

    var body: some View {
        // Compute the colors for border, fill, dot
        let colors = radioColors(
            isSelected: isSelected,
            isDisabled: isDisabled,
            isError: isError,
            brand: brand,
            colorScheme: colorScheme
        )
        
        ZStack {
            // 1) Outer circle (border)
            Circle()
                .strokeBorder(colors.border, lineWidth: 3)
                .frame(width: size, height: size)
            
            // 2) Inner fill
            Circle()
                .fill(colors.fill)
                .frame(width: size * 0.7, height: size * 0.7)
            
            // 3) Dot if selected
            if isSelected {
                Circle()
                    .fill(colors.dot)
                    .frame(width: size * 0.4, height: size * 0.4)
            }
        }
    }
    
    // MARK: - Use your color tokens in the switch
    private func radioColors(
        isSelected: Bool,
        isDisabled: Bool,
        isError: Bool,
        brand: Brand,
        colorScheme: ColorScheme
    ) -> (border: Color, fill: Color, dot: Color) {
        
        switch (isDisabled, isError, isSelected) {
            
        // DISABLED + unselected
        case (true, _, false):
            return (
                border: ColorToken.grayscale500.color(brand: brand, colorScheme: colorScheme),
                fill:   ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme),
                dot:    .clear
            )
        // DISABLED + selected
        case (true, _, true):
            return (
                border: ColorToken.grayscale500.color(brand: brand, colorScheme: colorScheme),
                fill:   ColorToken.grayscale300.color(brand: brand, colorScheme: colorScheme),
                dot:   ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
            )
            
        // ERROR + unselected
        case (_, true, false):
            let border = (brand == .de)
                ? ColorToken.redAccessible.color(brand: brand, colorScheme: colorScheme)
                : ColorToken.grayscale700.color(brand: brand, colorScheme: colorScheme)
            let fill = (brand == .de)
                ? ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
                : ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
            return (border, fill, .clear)
            
        // ERROR + selected
        case (_, true, true):
                // Error & selected:
                let fill = (brand == .de)
            ? ColorToken.redLight.color(brand: brand, colorScheme: colorScheme)
            : ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
                return (ColorToken.redAccessible.color(brand: brand, colorScheme: colorScheme), fill, ColorToken.redAccessible.color(brand: brand, colorScheme: colorScheme))
            
        // NORMAL + unselected
        case (_, _, false):
            let border = (brand == .de)
                ? ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme)
                : ColorToken.grayscale700.color(brand: brand, colorScheme: colorScheme)
            return (border, ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme), .clear)

        case (_, _, true):
                // Normal & selected:
                let fill = (brand == .de)
                    ? ColorToken.primaryLighter.color(brand: brand, colorScheme: colorScheme)
                    : ColorToken.grayscale000.color(brand: brand, colorScheme: colorScheme)
            let check = (brand == .de)
                ? ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme)
                : ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme)
                return (ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme), fill, check)
        }
    }
}
