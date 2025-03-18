//
//  ContentView.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//


import SwiftUI


struct ContentView: View, BrandStyleSupport {
    @State private var showToast = false
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
    @Environment(\.openURL) var openURL
    

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
   
                    
                    Text("Heading 1")
                                    .typographyStyle(.h1)
                    Text("Heading 2")
                                    .typographyStyle(.h2)
                                
                                
                                Text("Paragraph text")
                                    .typographyStyle(.p1)
                                
                                    Text("Link text underlined!")
                                                .underline()
                                                .foregroundColor(     colorToken(.primaryDarkest))
                                                .typographyStyle(.p2)
                                
          
                                
                                Text("Primary button text")
                                    .typographyStyle(.button)
                                    .padding()
                                    .background(colorToken(.containerFillTertiary1))
                                    .cornerRadius(8)
                    
                    
                    
                    Text("Sample Success Text")
                        .foregroundColor(colorToken(.greenAccessible))
                                    .font(.system(size: 26, weight: .heavy))
                    
                    Button("Show Toast") {
                        withAnimation {
                            showToast = true
                        }
                    
                    }
                    
                    
                    CardComponent(
                                        title: "What should I expect when I enroll in Home Base Essentials?",
                                        items: cardItems,
                                       iconColor:colorToken(.iconFeedbackSuccess),
                                       backgroundColor:colorToken(.containerFillTertiaryDefault)
                                    )

             
                }
                
                
                ToastComponent(
                    message: "Complete your Vivint offer by scheduling your installation.",
                    linkText: Text("Schedule installation") .font(.subheadline)
                        .foregroundColor(colorToken(.grayscale000)).bold(),
                    linkAction: {
                        openWebPage("https://www.vivint.com/")
                    },
                    image: Image("doorbell"),
                    backgroundColor:colorToken(.grayscale800),
                    duration: 60.0,
                    isVisible: $showToast
                )
                
            
            }
            .navigationTitle("MainPage")

        }
    }
    

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
