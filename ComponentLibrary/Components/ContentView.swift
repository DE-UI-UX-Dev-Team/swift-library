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
    
    @State private var selectedBrand: String = "brandDE"
    

    private let cardItems: [(icon: String, text: String)] = [
           (icon: "checkmark.circle", text: "First claim this offer. Then enroll by reviewing the terms and conditions."),
           (icon: "checkmark.circle", text: "Schedule an installation for your doorbell and thermostat."),
           (icon: "checkmark.circle", text: "We will give you a call before installation. When they complete installation you will have access.")
       ]

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    //Typography token system test samples for Reliant
                    Text("Heading 1")
                                    .TypographyStyle(.h1, colorUsage: .headingDefault, brand: selectedBrand)
                                
                                // 2. Paragraph
                                Text("Paragraph text")
                                    .TypographyStyle(.p1, colorUsage: .paragraphDefault, brand: selectedBrand)
                                
                                // 3. Link
                                Text("Link text underlined!")
                                    .TypographyStyle(.link, colorUsage: .link, brand: selectedBrand)
                                
                                // 4. Error
                                Text("Error message")
                                    .TypographyStyle(.p2, colorUsage: .paragraphError, brand: selectedBrand)
                                
                                // 5. Primary button text
                                Text("Primary button text")
                                    .TypographyStyle(.primaryButton, colorUsage: .primaryButton, brand: selectedBrand)
                                    .padding()
                                    .background(ColorToken.containerFillTertiary1.color( brand: selectedBrand,colorScheme: colorScheme))
                                    .cornerRadius(8)
                    
                    
                    
                    Text("Sample Success Text")
                                    .padding()
                                    .foregroundColor(ColorToken.greenAccessible.color( brand: selectedBrand,
                                                                                       colorScheme: colorScheme))
                                    .font(.system(size: 32, weight: .heavy))
                    
                    Button("Show Toast") {
                        withAnimation {
                            showToast = true
                        }
                    
                    }
                    .padding()
                    
                    
                    // Card View
                    CardView(
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
                ToastView(
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

