//
//  ConfirmationPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/13/25.
//

import SwiftUI



struct ConfirmationPage: View, BrandStyleSupport {
        @Environment(\.colorScheme) var colorScheme
        @Environment(\.brand) var brand
        
        
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: brandSpacing.pageLayout.sectionSpacing.l) {
                    
                    VStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 36))
                            .foregroundColor(colorToken(.greenBase))
                        
                        Text("Thank you for signing up!")
                            .foregroundColor(colorToken(.greenBase))
                            .typographyStyle(.h3)
                        
                        Text(" We are processing your sign up for <plan name>. Please check your email nrgtest1050 @nrg.com for confirmation.")
                            .typographyStyle(.p1)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.s)
                    
                    VStack(alignment: .leading,spacing: brandSpacing.containerSpacing.gaps.m) {
                        Text("Confirmation details").typographyStyle(.h3)
                        Text("Request submitted on 01/01/2023").typographyStyle(.p1)
                        Text("Confirmation number  0000123456778901").typographyStyle(.p1)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(brandSpacing.containerSpacing.padding.m)
                    .background(colorToken(.grayscale400))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    
                    
                    HStack {
                        Text("Account").foregroundColor(.secondary)
                        Spacer()
                        Text("Contract").foregroundColor(.secondary)
                        Spacer()
                        Text("New plan").fontWeight(.semibold)
                        Spacer()
                        Text("Document").foregroundColor(.secondary)
                    }
                    .typographyStyle(.p1)
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.none)
                    
                    
                    VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.m) {
                        
                        Text("2 FREE DAYS PER WEEK")
                            .typographyStyle(.h3)
                        HStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                            Tag(
                                text: "12 months",
                                style: .inactive
                            )
                            
                            Tag(
                                text: "Fixed rate",
                                style: .inactive
                                
                            )
                            
                            Tag(
                                text: "100% solar",
                                style: .inactive
                            )
                        }
                        
                        Text("Reliant Truly Free Nights 100% Solar 12 plan")
                            .typographyStyle(.h3)
                        
                        Text("Straightforward plan with locked-in energy charge")
                            .typographyStyle(.p1)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                            Tag(
                                text: "Recommended",
                                style: .active(.tertiaryBase),
                                iconPosition: .left
                            )
                            
                            Tag(
                                text: "$200 Bill Credit",
                                style: .active(.primaryBase)
                            )
                        }
                        
                        HStack {
                            Text("18.5¢/kWh")
                                .typographyStyle(.h2)
                            Spacer()
                            Text("price at 2,000 kWh")
                                .typographyStyle(.p1)
                                .foregroundColor(.secondary)
                        }
                        
                        Link(
                            text: "View plan details",
                            variant: .text,
                            isInline: false,
                            action: {
                                print("Standalone link tapped")
                            }
                        )
                    }
                    .padding(brandSpacing.containerSpacing.padding.m)
                    .brandBorderOverlay(
                        radiusKey: .m,
                        strokeKey: .thick,
                        color:colorToken(.grayscale400)
                    )

                    
                    Button(
                        title: "Button",
                        variant: .primary
                    ) {
                        print("Secondary tapped")
                    }
                }
 
            }
            
        }
        .padding(.top, brandSpacing.pageLayout.margins.top)
        .padding(.horizontal, brandSpacing.pageLayout.margins.horizontal)

    }
        
    }




struct ConfirmationPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            ConfirmationPage()
        }
    }
}

