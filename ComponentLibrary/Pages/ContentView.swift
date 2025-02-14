//
//  ContentView.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//


import SwiftUI


struct ContentView: View {
    @State private var showToast = false
    @Environment(\.colorScheme) var colorScheme
      
    @Environment(\.openURL) var openURL
    
    @State private var selectedBrand: Brand = .de
    

    private let cardItems: [(icon: String, text: String)] = [
           (icon: "checkmark.circle", text: "First claim this offer. Then enroll by reviewing the terms and conditions."),
           (icon: "checkmark.circle", text: "Schedule an installation for your doorbell and thermostat."),
           (icon: "checkmark.circle", text: "We will give you a call before installation. When they complete installation you will have access.")
       ]

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    
                    Text("Custom Inter Light Black Test!")
                        .font(.custom("Inter18pt-Black", size: 24))
                    Text("Custom Inter Bold Font Test!")
                        .font(.custom("Inter18pt-Bold", size: 24))
                    Text("Custom Inter Light Font Test!")
                        .font(.custom("Inter18pt-Light", size: 24))
   
                    
                    // Typography token system test samples for Reliant
                    Text("Heading 1")
                                    .typographyStyle(.h1, brand: selectedBrand)
                    Text("Heading 2")
                                    .typographyStyle(.h2, brand: selectedBrand)
                                
                                
                                // Paragraph
                                Text("Paragraph text")
                                    .typographyStyle(.p1, brand: selectedBrand)
                                
                              // In-line Link
                                    Text("Link text underlined!")
                                                .underline()
                                                .foregroundColor(ColorToken.primaryDarkest.color( brand: selectedBrand,
                                                                                                 colorScheme: colorScheme))
                                                .typographyStyle(.p2, brand: selectedBrand)
                                
          
                                
                                //  Primary button text
                                Text("Primary button text")
                                    .typographyStyle(.primaryButton, brand: selectedBrand)
                                    .padding()
                                    .background(ColorToken.containerFillTertiary1.color( brand: selectedBrand,colorScheme: colorScheme))
                                    .cornerRadius(8)
                    
                    
                    
                    Text("Sample Success Text")
                                    .foregroundColor(ColorToken.greenAccessible.color( brand: selectedBrand,
                                                                                       colorScheme: colorScheme))
                                    .font(.system(size: 26, weight: .heavy))
                    
                    Button("Show Toast") {
                        withAnimation {
                            showToast = true
                        }
                    
                    }
                    
                    
                    // Card View
                    CardComponent(
                                        title: "What should I expect when I enroll in Home Base Essentials?",
                                        items: cardItems,
                                       iconColor:ColorToken.iconFeedbackSuccess.color( brand: selectedBrand,
                                                colorScheme: colorScheme),
                                       backgroundColor:ColorToken.containerFillTertiaryDefault.color( brand: selectedBrand,colorScheme: colorScheme)
                                    )
                    
                    NavigationLink("Go to Another Page", value: "AnotherPage")
                        .padding()
                    NavigationLink("Go to Reliant Page", value: "AnotherBrandPage")
             
                }
                
                
                // Toast View
                ToastComponent(
                    message: "Complete your Vivint offer by scheduling your installation.",
                    linkText: Text("Schedule installation") .font(.subheadline)
                        .foregroundColor(ColorToken.grayscale000.color( brand: selectedBrand,
                                                                        colorScheme: colorScheme)).bold(),
                    linkAction: {
                        openWebPage("https://www.vivint.com/")
                    },
                    image: Image("doorbell"),
                    backgroundColor:ColorToken.grayscale800.color( brand: selectedBrand,
                                                                   colorScheme: colorScheme),
                    duration: 60.0,
                    isVisible: $showToast
                )
                
            
            }
            .navigationTitle("MainPage")
            .navigationDestination(for: String.self) { value in
                switch value {
                case "AnotherPage":
                    AnotherPage()
                case "AnotherBrandPage":
                    AnotherBrandPage()
                default:
                    EmptyView() // fallback
                }
            }

        }
    }
    
    // Cross-platform way to open a webpage in SwiftUI
     func openWebPage(_ urlString: String) {
         guard let url = URL(string: urlString) else {
             print("Invalid URL: \(urlString)")
             return
         }
         openURL(url)
     }
}
    
#Preview {
    ContentView()
}

