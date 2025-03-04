//
//  InputPage.swift
//  ComponentLibrary
//
//  Created by susan ruan on 2/18/25.
//


import SwiftUI


struct InputPage: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand
    

    @State private var singleRadioValue: String = ""
    @State private var singleRadioDisValue: String = ""
    @State private var singleCheckboxValue: String = ""
    @State private var singleCheckboxErrValue: String = ""
    @State private var singleCheckboxDisValue: String = ""
    @State private var groupRadioEValue: String = "EA"
    @State private var groupedRadioValue: String = "A"
    @State private var groupedCheckboxValue: String = "b"
        
    let singleRadioOption: [InputOption] = [
            InputOption(label: "Accept Terms", value: "accepted")
        ]
    
    let singleRadioDisOption: [InputOption] = [
        InputOption(label: "Disabled Radio", value: "Disabled Radio")
    ]
        let singleCheckboxOption: [InputOption] = [
            InputOption(label: "Enable Notifications", value: "notif")
        ]
    let singleCheckboxErrOption: [InputOption] = [
        InputOption(label: "Error Checkbox", value: "errcheckbox")
    ]
      let singleCheckboxDisabled: [InputOption] = [
        InputOption(label: "Disabled Checkbox", value: "isDisabled")
    ]
        

    let groupRadioErrors: [InputOption] = [
        InputOption(label: "Error Selected", value: "EA"),
        InputOption(label: "Error Unselected", value: "EB")
    ]
  
        let groupRadioOptions: [InputOption] = [
            InputOption(label: "Radio Normal Selected", value: "A"),
            InputOption(label: "Radio Normal Unselected", value: "B")
        ]
        
        let groupCheckboxOptions: [InputOption] = [
            InputOption(label: "Checkbox A", value: "a"),
            InputOption(label: "Checkbox B", value: "b"),
            InputOption(label: "Checkbox C", value: "c")
        ]
        
        var body: some View {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Single & Grouped Radios")
                            .typographyStyle(.h3)
                        
                             InputComponent(
                                                variant: .radio,
                                                value: $singleRadioValue,
                                                options: singleRadioOption
                                               
                                            )
                                            
                        InputComponent(
                                           variant: .radio,
                                           value: $singleRadioDisValue,
                                           options: singleRadioDisOption,
                                           isDisabled: true
                                          
                                       )

                        InputComponent(
                                              variant: .radio,
                                              value: $groupedRadioValue,
                                              options: groupRadioOptions

                                          )
                        InputComponent(
                         variant: .radio,
                        value: $groupRadioEValue,
                            options:groupRadioErrors,
                          label: "Radio Label",
                          hasError: true
                        )
                                            
       

                        Spacer()
                        
                        Text("Singl & Grouped Checkboxes")
                            .typographyStyle(.h3)
                        InputComponent(
                                                 variant: .checkbox,
                                                 value: $singleCheckboxValue,
                                                 options: singleCheckboxOption
                                             )
                        
                        InputComponent(
                                                 variant: .checkbox,
                                                 value: $singleCheckboxErrValue,
                                                 options: singleCheckboxErrOption,
                                                 hasError: true
                                             )
                     InputComponent(
                             variant: .checkbox,
                             value: $singleCheckboxDisValue,
                             options: singleCheckboxDisabled,
                             isDisabled: true
                             
                         )
                        
                        

                                            InputComponent(
                                                variant: .checkbox,
                                                value: $groupedCheckboxValue,
                                                options: groupCheckboxOptions,
                                                label: "Checkboxe Label"
                                            )
                    }
                    .padding()
                }

            }
        }
}

struct InputPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            InputPage()
        }
    }
}
