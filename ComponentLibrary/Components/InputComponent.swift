//
//  InputComponent.swift
//  ComponentLibrary
//
//  Created by susan ruan on 2/18/25.
//

import SwiftUI


enum InputVariant: CaseIterable {
    case radio
    case checkbox
}

enum InputState: Hashable {
    case normal
    case selected
    case disabled
    case error
}

struct InputOption: Identifiable {
    let id = UUID()
    let label: String
    let value: String
}


struct InputStyleConfig {
    struct CheckboxConfig {
        let sizeMultiplier: CGFloat
        let borderStroke: CGFloat
        let colors: [InputState: (border: ColorToken, fill: ColorToken, check: ColorToken)]
    }
    
    struct RadioConfig {
        let borderStroke: CGFloat
        let colors: [InputState: (border: ColorToken, fill: ColorToken, dot: ColorToken)]
    }
    
    let checkbox: CheckboxConfig
    let radio: RadioConfig
    
    static let styles: [Brand: InputStyleConfig] = [
        .de: InputStyleConfig(
            checkbox: CheckboxConfig(
                sizeMultiplier: 1.2,
                borderStroke: 3,
                colors: [
                    .disabled: (.grayscale500, .grayscale500, .grayscale000),
                    .error: (.redAccessible, .redLight, .redAccessible),
                    .normal: (.grayscale900, .grayscale000, .grayscale000),
                    .selected: (.grayscale900, .primaryLighter, .grayscale900)
                ]
            ),
            radio: RadioConfig(
                borderStroke: 3,
                colors: [
                    .disabled: (.grayscale500, .grayscale300, .grayscale000),
                    .error: (.redAccessible, .redLight, .redAccessible),
                    .normal: (.grayscale900, .grayscale000, .grayscale000),
                    .selected: (.grayscale900, .primaryLighter, .grayscale900)
                ]
            )
        ),
        .reliant: InputStyleConfig(
            checkbox: CheckboxConfig(
                sizeMultiplier: 1.0,
                borderStroke: 2,
                colors: [
                    .disabled: (.grayscale500, .grayscale000, .grayscale000),
                    .error: (.redAccessible, .grayscale000, .redAccessible),
                    .normal: (.grayscale700, .grayscale000, .grayscale000),
                    .selected: (.grayscale900, .grayscale900, .grayscale000)
                ]
            ),
            radio: RadioConfig(
                borderStroke: 2,
                colors: [
                    .disabled: (.grayscale500, .grayscale000, .grayscale000),
                    .error: (.redAccessible, .grayscale000, .redAccessible),
                    .normal: (.grayscale700, .grayscale000, .grayscale000),
                    .selected: (.grayscale900, .grayscale000, .grayscale900)
                ]
            )
        )
    ]
    
    static func forBrand(_ brand: Brand) -> InputStyleConfig {
        styles[brand] ?? styles[.de]!
    }

}


struct InputComponent: View {
    @Environment(\.colorScheme) var colorScheme
    let selectedBrand: Brand
    let variant: InputVariant
    @Binding var value: String
    var options: [InputOption]
    var label: String? = nil
    var hasError: Bool = false
    var isDisabled: Bool = false
    
    private var style: InputStyleConfig { InputStyleConfig.forBrand(selectedBrand) }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let label = label {
                Text(label)
                    .typographyStyle(.p1, brand: selectedBrand)
                    .foregroundColor(colorFor(isDisabled: isDisabled))
            }
            
            switch variant {
            case .checkbox:
                ForEach(options) { option in
                    let selectedValues = value.split(separator: ",").map(String.init)
                    let isSelected = selectedValues.contains(option.value)
                    Button(action: {
                        guard !isDisabled else { return }
                        var newValues = Set(selectedValues)
                        if isSelected { newValues.remove(option.value) } else { newValues.insert(option.value) }
                        value = newValues.joined(separator: ",")
                    }) {
                        HStack {
                            CustomCheckbox(
                                isSelected: isSelected,
                                isDisabled: isDisabled,
                                isError: hasError,
                                brand: selectedBrand,
                                colorScheme: colorScheme
                            )
                            Text(option.label)
                                .typographyStyle(.p2, brand: selectedBrand)
                                .foregroundColor(colorFor(isDisabled: isDisabled))
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
                            CustomRadioButton(
                                isSelected: isSelected,
                                isDisabled: isDisabled,
                                isError: hasError,
                                brand: selectedBrand,
                                colorScheme: colorScheme
                            )
                            Text(option.label)
                                .typographyStyle(.p2, brand: selectedBrand)
                                .foregroundColor(colorFor(isDisabled: isDisabled))
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(isDisabled)
                }
            }
        }
        .padding(8)
    }
    
    private func colorFor(isDisabled: Bool) -> Color {
        (isDisabled ? ColorToken.grayscale500 : ColorToken.grayscale900)
            .color(brand: selectedBrand, colorScheme: colorScheme)
    }
}


struct CustomCheckbox: View {
    var isSelected: Bool
    var isDisabled: Bool
    var isError: Bool
    var size: CGFloat = 18
    var brand: Brand
    var colorScheme: ColorScheme
    
    private var config: InputStyleConfig.CheckboxConfig { InputStyleConfig.forBrand(brand).checkbox }
    
    var body: some View {
        let state = stateFor(isSelected: isSelected, isDisabled: isDisabled, isError: isError)
        let colors = config.colors[state] ?? config.colors[.normal]!
        let checkboxSize = size * config.sizeMultiplier
        
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .strokeBorder(colors.border.color(brand: brand, colorScheme: colorScheme), lineWidth: config.borderStroke)
                .frame(width: checkboxSize, height: checkboxSize)
            RoundedRectangle(cornerRadius: 2)
                .fill(colors.fill.color(brand: brand, colorScheme: colorScheme))
                .frame(width: checkboxSize * 0.8, height: checkboxSize * 0.8)
            if isSelected {
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: checkboxSize * 0.5, height: checkboxSize * 0.5)
                    .foregroundColor(colors.check.color(brand: brand, colorScheme: colorScheme))
                    .font(.system(size: checkboxSize * 0.5, weight: .black))
            }
        }
    }
    
    private func stateFor(isSelected: Bool, isDisabled: Bool, isError: Bool) -> InputState {
        if isDisabled { return .disabled }
        if isError { return .error }
        return isSelected ? .selected : .normal
    }
}


struct CustomRadioButton: View {
    var isSelected: Bool
    var isDisabled: Bool
    var isError: Bool
    var size: CGFloat = 20
    var brand: Brand
    var colorScheme: ColorScheme
    
    private var config: InputStyleConfig.RadioConfig { InputStyleConfig.forBrand(brand).radio }
    
    var body: some View {
        let state = stateFor(isSelected: isSelected, isDisabled: isDisabled, isError: isError)
        let colors = config.colors[state] ?? config.colors[.normal]!
        
        ZStack {
            Circle()
                .strokeBorder(colors.border.color(brand: brand, colorScheme: colorScheme), lineWidth: config.borderStroke)
                .frame(width: size, height: size)
            Circle()
                .fill(colors.fill.color(brand: brand, colorScheme: colorScheme))
                .frame(width: size * 0.7, height: size * 0.7)
            if isSelected {
                Circle()
                    .fill(colors.dot.color(brand: brand, colorScheme: colorScheme))
                    .frame(width: size * 0.4, height: size * 0.4)
            }
        }
    }
    
    private func stateFor(isSelected: Bool, isDisabled: Bool, isError: Bool) -> InputState {
        if isDisabled { return .disabled }
        if isError { return .error }
        return isSelected ? .selected : .normal
    }
}



