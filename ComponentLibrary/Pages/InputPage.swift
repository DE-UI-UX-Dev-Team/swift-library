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
        
        // Grouped radio & checkbox state
        @State private var groupedRadioValue: String = ""
        @State private var groupedCheckboxValue: String = ""
        
        
        // Single radio/checkbox options could also be external if needed,
        // but here we only have one for each single example
        let singleRadioOptions: [InputOption] = [
            InputOption(label: "Accept Terms", value: "accepted")
        ]
        
        let singleCheckboxOptions: [InputOption] = [
            InputOption(label: "Enable Notifications", value: "notif")
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
                                                label: "Single Radio",
                                                status: .warning("You must accept the Terms!")
                                            )
                                            
                                            // Single Checkbox
                                            InputComponent(
                                                selectedBrand: selectedBrand,
                                                variant: .checkbox,
                                                value: $singleCheckboxValues,
                                                options: singleCheckboxOptions,
                                                label: "Single Checkbox",
                                                status: .error("Notifications are required.")
                                            )
                                            
                                            // Grouped Radio
                                            InputComponent(
                                                selectedBrand: selectedBrand,
                                                variant: .radio,
                                                value: $groupedRadioValue,
                                                options: groupRadioOptions,
                                                label: "Grouped Radio",
                                                status: .success("All set!")
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
                .navigationBarTitle("Modular Inputs", displayMode: .inline)
            }
        }
}

struct InputPage_Previews: PreviewProvider {
    static var previews: some View {
        InputPage()
    }
}
