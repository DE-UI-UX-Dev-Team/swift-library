//
//  InputComponent.swift
//  ComponentLibrary
//
//  Created by susan ruan on 2/18/25.
//

import SwiftUI
//.buttonStyle(PlainButtonStyle())



// MARK: - 6) InputVariant
enum InputVariant: CaseIterable {
    case radio
    case checkbox
    // Could add .disabled, .errorState, etc. if needed
}

// MARK: - 7) InputStyleConfig
struct InputStyleConfig {
    let foregroundColor: Color
    let shape: AnyShape
    let typographyStyle: MyTextStyle
    let padding: CGFloat

    static func get(for brand: Brand, variant: InputVariant, colorScheme: ColorScheme) -> InputStyleConfig {
        
        let style = brandStyles[brand] ?? defaultBrandStyle
        
        let fgColor = style.getColor(for: variant, type: .foreground, brand: brand, colorScheme: colorScheme)

        
        return InputStyleConfig(
            foregroundColor: fgColor,
            shape: style.shape,
            typographyStyle: .primaryButton, // or a specific style for input
            padding: style.padding
        )
    }
    
    enum ColorType {
        case foreground
    }
    
    struct BrandStyle {
        let colors: [InputVariant: [ColorType: ColorToken]]
        let shape: AnyShape
        let padding: CGFloat
        
        func getColor(for variant: InputVariant,
                      type: ColorType,
                      brand: Brand,
                      colorScheme: ColorScheme) -> Color {
            colors[variant]?[type]?.color(brand: brand, colorScheme: colorScheme) ?? .clear
        }
    }
}

// MARK: - Brand-based input styles
extension InputStyleConfig {
    static let brandStyles: [Brand: BrandStyle] = [
        .de: BrandStyle(
            colors: [
                .radio: [
                    .foreground: .grayscale900,
                ],
                .checkbox: [
                    .foreground: .grayscale900,
                ]
            ],
            shape: AnyShape(RoundedRectangle(cornerRadius: 4)),
            padding: 8
        ),
        .reliant: BrandStyle(
            colors: [
                .radio: [
                    .foreground: .grayscale900,
                ],
                .checkbox: [
                    .foreground: .primaryBase,
                ]
            ],
            shape: AnyShape(Capsule()),
            padding: 8
        )
    ]
    
    static let defaultBrandStyle = BrandStyle(
        colors: [
            .radio: [
                .foreground: .grayscale900,
            ],
            .checkbox: [
                .foreground: .primaryBase,
            ]
        ],
        shape: AnyShape(RoundedRectangle(cornerRadius: 8)),
        padding: 8
    )
}

// MARK: - 8) InputStatus & StatusMessageView
enum InputStatus {
    case none
    case error(String)
    case success(String)
    case warning(String)
    
    var message: String? {
        switch self {
        case .none:
            return nil
        case .error(let msg), .success(let msg), .warning(let msg):
            return msg
        }
    }
}

struct StatusMessageView: View {
    let status: InputStatus
    
    var body: some View {
        if let message = status.message {
            Text(message)
                .font(.footnote)
                .foregroundColor(color(for: status))
        }
    }
    
    private func color(for status: InputStatus) -> Color {
        switch status {
        case .none:     return .clear
        case .error:    return .red
        case .success:  return .green
        case .warning:  return .orange
        }
    }
}

// MARK: - 9) InputOption
struct InputOption: Identifiable {
    let id = UUID()
    let label: String
    let value: String
}

// MARK: - 10) InputComponent
struct InputComponent: View {
    @Environment(\.colorScheme) var colorScheme
    
    let selectedBrand: Brand
    let variant: InputVariant
    @Binding var value: String    // radio or checkbox selection string
    var options: [InputOption]
    var label: String? = nil
    var status: InputStatus = .none
    
    var body: some View {
        let styleConfig = InputStyleConfig.get(
            for: selectedBrand,
            variant: variant,
            colorScheme: colorScheme
        )
        
        VStack(alignment: .leading, spacing: 4) {
            // Title label (brand styled)
            if let label = label {
                Text(label)
                    .typographyStyle(styleConfig.typographyStyle, brand: selectedBrand)
                    .foregroundColor(styleConfig.foregroundColor)
            }
            
            switch variant {
            case .radio:
                // Single or multiple radio items
                ForEach(options) { option in
                    let isSelected = (value == option.value)
                    
                    Button(action: {
                        // Radio selection
                        value = option.value
                    }) {
                        HStack {
                            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(styleConfig.foregroundColor)
                            Text(option.label)
                                .typographyStyle(styleConfig.typographyStyle, brand: selectedBrand)
                                .foregroundColor(styleConfig.foregroundColor)
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
            case .checkbox:
                // Single or multiple checkboxes
                ForEach(options) { option in
                    let selectedValues = value.split(separator: ",").map(String.init)
                    let isSelected = selectedValues.contains(option.value)
                    
                    Button(action: {
                        var newValues = Set(selectedValues)
                        if isSelected {
                            newValues.remove(option.value)
                        } else {
                            newValues.insert(option.value)
                        }
                        value = newValues.joined(separator: ",")
                    }) {
                        HStack {
                            Image(systemName: isSelected ? "checkmark.square" : "square")
                                .foregroundColor(styleConfig.foregroundColor)
                            Text(option.label)
                                .typographyStyle(styleConfig.typographyStyle, brand: selectedBrand)
                                .foregroundColor(styleConfig.foregroundColor)
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            // Display error/success/warning
            StatusMessageView(status: status)
                .padding(.top, 2)
        }
        .padding(styleConfig.padding)
    }
}
