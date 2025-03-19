

import SwiftUI

enum InputVariant: CaseIterable {
    case radio, checkbox
}

enum InputState: Hashable {
    case normal, selected, disabled, error
}

struct InputOption: Identifiable {
    let id = UUID()
    let label: String
    let value: String
}

struct InputStyleConfig {
    struct CheckboxConfig {
        let size: CGFloat
        let colors: [InputState: (border: ColorToken, fill: ColorToken, check: ColorToken)]
    }
    
    struct RadioConfig {
        let size: CGFloat
        let colors: [InputState: (border: ColorToken, fill: ColorToken, dot: ColorToken)]
    }
    
    let checkbox: CheckboxConfig
    let radio: RadioConfig
    
    static let styles: [Brand: InputStyleConfig] = [
        .de: InputStyleConfig(
            checkbox: CheckboxConfig(
                size: 20,
                colors: [
                    .disabled: (.grayscale500, .grayscale500, .grayscale000),
                    .error: (.redAccessible, .redLight, .redAccessible),
                    .normal: (.grayscale900, .grayscale000, .grayscale000),
                    .selected: (.grayscale900, .primaryLighter, .grayscale900)
                ]
            ),
            radio: RadioConfig(
                size: 20,
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
                size: 18,
                colors: [
                    .disabled: (.grayscale500, .grayscale000, .grayscale000),
                    .error: (.redAccessible, .grayscale000, .redAccessible),
                    .normal: (.grayscale700, .grayscale000, .grayscale000),
                    .selected: (.grayscale900, .grayscale900, .grayscale000)
                ]
            ),
            radio: RadioConfig(
                size: 20,
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

struct Input: View, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
    let variant: InputVariant
    @Binding var value: String
    var options: [InputOption]
    var label: String? = nil
    var hasError: Bool = false
    var isDisabled: Bool = false

    
    private var style: InputStyleConfig { InputStyleConfig.forBrand(brand) }
    
    var body: some View {
        VStack(alignment: .leading,spacing: brandSpacing.containerSpacing.gaps.m) {
            if let label = label {
                Text(label)
                    .typographyStyle(.p1)
                    .foregroundColor(colorFor(isDisabled: isDisabled))
            }
            
            switch variant {
            case .checkbox:
                ForEach(options, id: \.id) { option in
                    let selectedValues = value.split(separator: ",").map(String.init)
                    let isSelected = selectedValues.contains(option.value)
                    SwiftUI.Button(action: {
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
                            CustomCheckbox(
                                isSelected: isSelected,
                                isDisabled: isDisabled,
                                isError: hasError
                            )
                            Text(option.label)
                                .typographyStyle(.p2)
                                .foregroundColor(colorFor(isDisabled: isDisabled))
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(isDisabled)
                }
            case .radio:
                ForEach(options, id: \.id) { option in
                    let isSelected = (value == option.value)
                    SwiftUI.Button(action: {
                        guard !isDisabled else { return }
                        value = option.value
                    }) {
                        HStack {
                            CustomRadioButton(
                                isSelected: isSelected,
                                isDisabled: isDisabled,
                                isError: hasError
                            )
                            Text(option.label)
                                .typographyStyle(.p2)
                                .foregroundColor(colorFor(isDisabled: isDisabled))
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(isDisabled)
                }
            }
        }
    }
    
    private func colorFor(isDisabled: Bool) -> Color {
        colorToken(isDisabled ? .grayscale500 : .grayscale900)
    }
}

struct CustomCheckbox: View, BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    var isSelected: Bool
    var isDisabled: Bool
    var isError: Bool
    
    private var config: InputStyleConfig.CheckboxConfig { InputStyleConfig.forBrand(brand).checkbox }
    
    var body: some View {
        let state = stateFor(isSelected: isSelected, isDisabled: isDisabled, isError: isError)
        let colors = config.colors[state] ?? config.colors[.normal]!
        let checkboxSize = config.size
        
        ZStack {
            RoundedRectangle(cornerRadius: 0) // Initial radius doesn't matter as it's overridden
                .fill(colorToken(colors.fill))
                .frame(width: checkboxSize, height: checkboxSize)
                .brandBorderOverlay(
                    radiusKey: .s,
                    strokeKey: .thick,
                    color: colorToken(colors.border)
                )
            if isSelected {
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: checkboxSize * 0.6, height: checkboxSize * 0.6)
                    .foregroundColor(colorToken(colors.check))
                    .font(.system(size: checkboxSize * 0.6, weight: .black))
            }
        }
    }
    
    private func stateFor(isSelected: Bool, isDisabled: Bool, isError: Bool) -> InputState {
        if isDisabled { return .disabled }
        if isError { return .error }
        return isSelected ? .selected : .normal
    }
}

struct CustomRadioButton: View , BrandStyleSupport {
    @Environment(\.brand) var brand
    @Environment(\.colorScheme) var colorScheme
    var isSelected: Bool
    var isDisabled: Bool
    var isError: Bool
    
    private var config: InputStyleConfig.RadioConfig { InputStyleConfig.forBrand(brand).radio }
    
    var body: some View {
        let state = stateFor(isSelected: isSelected, isDisabled: isDisabled, isError: isError)
        let colors = config.colors[state] ?? config.colors[.normal]!
        let radioSize = config.size
        
        ZStack {
            Circle()
                .fill(colorToken(colors.fill))
                .frame(width: radioSize, height: radioSize)
                .brandBorderOverlay(
                    radiusKey: .full,
                    strokeKey: .thick,
                    color: colorToken(colors.border)
                )
            if isSelected {
                Circle()
                    .fill(colorToken(colors.dot))
                    .frame(width: radioSize * 0.4, height: radioSize * 0.4)
            }
        }
    }
    
    private func stateFor(isSelected: Bool, isDisabled: Bool, isError: Bool) -> InputState {
        if isDisabled { return .disabled }
        if isError { return .error }
        return isSelected ? .selected : .normal
    }
}
