//
//  InputPage.swift
//  ComponentLibrary
//
//  Created by susan ruan on 2/18/25.
//


import SwiftUI


struct InputPage: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedBrand: Brand = .reliant
    
    // Single radio & checkbox state
        @State private var singleRadioValue: String = ""
        @State private var singleCheckboxValues: String = ""
    @State private var singleCheckboxDisValues: String = "isDisabled"
        
        // Grouped radio & checkbox state
       @State private var groupRadioEValue: String = ""
        @State private var groupedRadioValue: String = ""
   
        @State private var groupedCheckboxValue: String = "b"
        
        
        // Single radio/checkbox options could also be external if needed,
        // but here we only have one for each single example
        let singleRadioOptions: [InputOption] = [
            InputOption(label: "Accept Terms", value: "accepted")
        ]
        
        let singleCheckboxOptions: [InputOption] = [
            InputOption(label: "Enable Notifications", value: "notif")
        ]
      let singleCheckboxDisabled: [InputOption] = [
        InputOption(label: "Disabled", value: "isDisabled")
    ]
        
    // Options for grouped radios
    let groupRadioErrors: [InputOption] = [
        InputOption(label: "Error A", value: "EA"),
        InputOption(label: "Error B", value: "EB")
    ]
        // Options for grouped radios
        let groupRadioOptions: [InputOption] = [
            InputOption(label: "Radio A", value: "A"),
            InputOption(label: "Radio B", value: "B")
        ]
        
        // Options for grouped checkboxes
        let groupCheckboxOptions: [InputOption] = [
            InputOption(label: "Checkbox A", value: "a"),
            InputOption(label: "Checkbox B", value: "b"),
            InputOption(label: "Checkbox C", value: "c")
        ]
        
        var body: some View {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // MARK: Single Radio
                        Text("Single Radio")
                            .font(.title2)
                        // Single Radio
                                            InputComponent(
                                                selectedBrand: selectedBrand,
                                                variant: .radio,
                                                value: $singleRadioValue,
                                                options: singleRadioOptions,
                                                label: "Single Radio"
                                               
                                            )
                                            
                                            // Single Checkbox
                                            InputComponent(
                                                selectedBrand: selectedBrand,
                                                variant: .checkbox,
                                                value: $singleCheckboxValues,
                                                options: singleCheckboxOptions,
                                                label: "Single Checkbox",
                                                hasError: true
                                            )
                        InputComponent(
                            selectedBrand: selectedBrand,
                            variant: .checkbox,
                            value: $singleCheckboxDisValues,
                            options: singleCheckboxDisabled,
                            label: "Single Checkbox",
//                            hasError: true,
                            isDisabled: true
                            
                        )
                         //Grouped Radio
                        InputComponent(
                            selectedBrand: selectedBrand,
                            variant: .radio,
                            value: $groupRadioEValue,
                            options:groupRadioErrors,
                            label: "Grouped Radio",
                          hasError: true
                        )
                                            
                                            // Grouped Radio
                                            InputComponent(
                                                selectedBrand: selectedBrand,
                                                variant: .radio,
                                                value: $groupedRadioValue,
                                                options: groupRadioOptions,
                                                label: "Grouped Radio"
                                            )
                        
                        
                                         // Grouped Checkboxes
                                            InputComponent(
                                                selectedBrand: selectedBrand,
                                                variant: .checkbox,
                                                value: $groupedCheckboxValue,
                                                options: groupCheckboxOptions,
                                                label: "Grouped Checkboxes"
                                            )
                      
                                            
                                            // Brand Picker
                                            Picker("Brand", selection: $selectedBrand) {
                                                ForEach(Brand.allCases, id: \.self) { brand in
                                                    Text(brand.rawValue).tag(brand)
                                                }
                                            }
                                            .pickerStyle(SegmentedPickerStyle())
                        
                        // Additional layout
                    }
                    .padding()
                }

            }
        }
}

struct InputPage_Previews: PreviewProvider {
    static var previews: some View {
        InputPage()
    }
}
