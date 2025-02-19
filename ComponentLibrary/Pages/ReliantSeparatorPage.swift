
import SwiftUI

struct SeparatorDemoPage: View {
   @Environment(\.colorScheme) var colorScheme
   @Environment(\.brand) private var brand
   
   var body: some View {
       ScrollView {
           VStack(alignment: .leading, spacing: 16) {
               Text("Separator Demo Page")
                   .typographyStyle(.h1,  brand: brand)
                   .padding(.bottom, 8)
               
               Text("This is an example of a **horizontal separator**:")
                   .typographyStyle(.h4,  brand: brand)
               
               Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                   .typographyStyle(.p1,  brand: brand)
               
                   ButtonComponent(
                
                       title: "Button",
                       variant: .primary
                   )
               
               SeparatorComponent( type: .horizontal, label: "OR")
               
               
               Text("Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.").typographyStyle(.p1,  brand: brand)
              
                   ButtonComponent(
                       title: "Button",
                       variant: .secondary
                   )
               
               Spacer().frame(height: 10)
               
               SeparatorComponent( type: .horizontal)
               
               Spacer().frame(height: 10)
               
               Text("This is an example of a **vertical separator**:")
                   .typographyStyle(.h4,  brand: brand)
               
               HStack {
                   // **First Column - Features**
                   VStack(spacing: 8) {
                       Text("Features")
                           .typographyStyle(.h5, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                       
                       Text("✓ High Performance")
                           .typographyStyle(.p1, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                       
                       Text("✓ Easy Integration")
                           .typographyStyle(.p1, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                       
                       Text("✓ Secure & Reliable")
                           .typographyStyle(.p1, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                   }
                   
                   SeparatorComponent( type: .vertical)
                   
                   VStack(spacing: 8) {
                       Text("Pricing")
                           .typographyStyle(.h5, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                       
                       Text("$9.99 / month")
                           .typographyStyle(.p1, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                       
                       Text("$99.99 / year")
                           .typographyStyle(.p1, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                       
                       Text("Custom Enterprise Plans")
                           .typographyStyle(.p1, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                   }
               }
               Spacer().frame(height: 10)
               Text("Vertical separator with Label:")
                   .typographyStyle(.h4,  brand: brand)
               
               HStack {
                   
                   VStack(spacing: 8) {
                       Text("Sign In with Email")
                           .typographyStyle(.h5, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                       
                       ButtonComponent(
                           title: "Continue with Email",
                           variant: .primary,
                           size: .small
                       )
                   }
                   
                       SeparatorComponent( type: .vertical, label: "OR")
                   
                   VStack(spacing: 8) {
                       Text("Sign In with Social Media")
                           .typographyStyle(.h5, brand: brand)
                           .frame(maxWidth: .infinity, alignment: .center)
                       
                       ButtonComponent(
                           title: "Continue with Google",
                           variant: .secondary,
                           size: .small
                       )
                       
                       ButtonComponent(
                           title: "Continue with Apple",
                           variant: .secondary,
                           size: .small
                       )
                   }
               }
               .padding()
           }
           .padding()
       }
       .navigationTitle("Separator Demo")
   }
}

struct SeparatorDemoPage_Previews: PreviewProvider {
   static var previews: some View {
       SeparatorDemoPage()
   }
}

