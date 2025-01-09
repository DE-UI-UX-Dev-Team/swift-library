//
//  ContentView.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/9/25.
//


import SwiftUI


struct ContentView: View {
    @State private var showToast = false
    @Environment(\.colorScheme) var colorScheme
      
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
                    
                    Text("Sample Success Text")
                                    .padding()
                                    .foregroundColor(ColorToken.greenAccessible.color(colorScheme))
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
iconColor:ColorToken.iconFeedbackSuccess.color(colorScheme),
                                       backgroundColor:ColorToken.containerFillTertiaryDefault.color(colorScheme)
                                    )
                    
                    NavigationLink("Go to Another Page", value: "AnotherPage")
             
                }
                
                
                // Toast View
                ToastView(
                    message: "Complete your Vivint offer by scheduling your installation.",
                    linkText: Text("Schedule installation") .font(.subheadline)
                        .foregroundColor(ColorToken.grayscale000.color(colorScheme)).bold(),
                    linkAction: {
                        openWebPage("https://www.vivint.com/")
                    },
                    image: Image("doorbell"),
                    backgroundColor:ColorToken.grayscale800.color(colorScheme),
                    duration: 60.0,
                    isVisible: $showToast
                )
                
            
            }
            .navigationTitle("MainPage")
            .navigationDestination(for: String.self) { value in
                if value == "AnotherPage" {
                    AnotherPage()
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

