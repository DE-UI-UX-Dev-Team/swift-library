//
//  ConfirmationPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/13/25.
//

import SwiftUI



struct ConfirmationPage: View {
        @Environment(\.colorScheme) var colorScheme
        @Environment(\.brand) private var brand
        
        private var brandSpacing: BrandSpacing {
            SpacingTokenManager.shared.spacing(for: brand)
        }
        
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: brandSpacing.pageLayout.sectionSpacing.l) {
                    
                    VStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 36))
                            .foregroundColor(ColorToken.greenBase.color( brand: brand,colorScheme: colorScheme))
                        
                        Text("Thank you for signing up!")
                            .foregroundColor(ColorToken.greenBase.color( brand: brand,colorScheme: colorScheme))
                            .typographyStyle(.h3,  brand: brand)
                        
                        Text(" We are processing your sign up for <plan name>. Please check your email nrgtest1050 @nrg.com for confirmation.")
                            .typographyStyle(.p1,  brand: brand)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.s)
                    
                    VStack(alignment: .leading,spacing: brandSpacing.containerSpacing.gaps.m) {
                        Text("Confirmation details").typographyStyle(.h3,  brand: brand)
                        Text("Request submitted on 01/01/2023").typographyStyle(.p1,  brand: brand)
                        Text("Confirmation number  0000123456778901").typographyStyle(.p1,  brand: brand)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(brandSpacing.containerSpacing.padding.m)
                    .background(ColorToken.grayscale400.color(brand: brand, colorScheme: colorScheme))
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
                    .typographyStyle(.p1,  brand: brand)
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.none)
                    
                    
                    VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.m) {
                        
                        Text("2 FREE DAYS PER WEEK")
                            .typographyStyle(.h3,  brand: brand)
                        HStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                            TagView(
                                text: "12 months",
                                style: .inactive
                            )
                            
                            TagView(
                                text: "Fixed rate",
                                style: .inactive
                                
                            )
                            
                            TagView(
                                text: "100% solar",
                                style: .inactive
                            )
                        }
                        
                        Text("Reliant Truly Free Nights 100% Solar 12 plan")
                            .typographyStyle(.h3,  brand: brand)
                        
                        Text("Straightforward plan with locked-in energy charge")
                            .typographyStyle(.p1,  brand: brand)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                            TagView(
                                text: "Recommended",
                                style: .active(ColorToken.tertiaryBase),
                                iconPosition: .left
                            )
                            
                            TagView(
                                text: "$200 Bill Credit",
                                style: .active(ColorToken.primaryBase)
                            )
                        }
                        
                        HStack {
                            Text("18.5¢/kWh")
                                .typographyStyle(.h2,  brand: brand)
                            Spacer()
                            Text("price at 2,000 kWh")
                                .typographyStyle(.p1,  brand: brand)
                                .foregroundColor(.secondary)
                        }
                        
                        LinkComponent(
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
                        brand: brand,
                        radiusKey: .m,
                        strokeKey: .thick,
                        color:ColorToken.grayscale400.color( brand: brand,colorScheme: colorScheme) )

                    
                    ButtonComponent(
                        title: "Button",
                        variant: .primary
                    ) {
                        print("Secondary tapped")
                    }
                }
                
                
                
            }
            
        }
        .padding(.bottom, brandSpacing.pageLayout.margins.bottom)
        .padding(.horizontal, brandSpacing.pageLayout.margins.horizontal)
        .padding(.top, brandSpacing.pageLayout.margins.top)
        .background(Color.gray.opacity(0.05).edgesIgnoringSafeArea(.horizontal))
//        .frame(height: brandSpacing.pageLayout.heights.mobileSmall)
    }
        
    }




struct ConfirmationPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            ConfirmationPage()
        }
    }
}
