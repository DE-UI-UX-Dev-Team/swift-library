//
//  SpacingPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/13/25.
//

import SwiftUI



struct SpacingPage: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedBrand: Brand = .reliant
    
    private var brandSpacing: BrandSpacing {
        SpacingManager.shared.spacing(for: selectedBrand)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: brandSpacing.pageLayout.sectionSpacing.xl) {
                    
                    VStack(spacing: brandSpacing.pageLayout.sectionSpacing.s) {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 36))
                            .foregroundColor(ColorToken.greenBase.color( brand: selectedBrand,colorScheme: colorScheme))
                        
                        Text("Thank you for signing up!")
                            .foregroundColor(ColorToken.greenBase.color( brand: selectedBrand,colorScheme: colorScheme))
                            .typographyStyle(.h3,  brand: selectedBrand)
                        
                        Text("We are processing your sign up for <plan name>. Please check your email nrgtest1050 @nrg.com for confirmation.")
                            .typographyStyle(.p1,  brand: selectedBrand)
                    }
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.xl)

                    
                    VStack(alignment: .leading,spacing: brandSpacing.containerSpacing.gaps.m) {
                        Text("Confirmation details Confirmation details").typographyStyle(.h3,  brand: selectedBrand)
                        Text("Request submitted on 01/01/2023").typographyStyle(.p1,  brand: selectedBrand)
                        Text("Confirmation number  0000123456778901").typographyStyle(.p1,  brand: selectedBrand)
                    }
                    .padding(brandSpacing.containerSpacing.padding.l)
                    .background(ColorToken.grayscale000.color(brand: selectedBrand, colorScheme: colorScheme))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .frame(width: .infinity, alignment: .leading)


                    HStack {
                        Text("Account").foregroundColor(.secondary)
                        Spacer()
                        Text("New contract").foregroundColor(.secondary)
                        Spacer()
                        Text("New plan").fontWeight(.semibold)
                        Spacer()
                        Text("Documents").foregroundColor(.secondary)
                    }
                    .typographyStyle(.p1,  brand: selectedBrand)
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.s)
                    
                    VStack(alignment: .leading, spacing: brandSpacing.containerSpacing.gaps.m) {
                        
                        Text("2 FREE DAYS PER WEEK")
                            .typographyStyle(.h3,  brand: selectedBrand)
                        

                        HStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                            PlanChip(text: "12 months", brandSpacing: brandSpacing)
                            PlanChip(text: "Fixed rate", brandSpacing: brandSpacing)
                            PlanChip(text: "100% solar", brandSpacing: brandSpacing)
                        }.typographyStyle(.p3,  brand: selectedBrand)
                        
                        Text("Reliant Truly Free Nights 100% Solar 12 plan")
                            .typographyStyle(.h3,  brand: selectedBrand)
                        
                        Text("Straightforward plan with locked-in energy charge")
                            .typographyStyle(.p1,  brand: selectedBrand)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: brandSpacing.containerSpacing.gaps.s) {
                            BadgeView(text: "Recommended",
                                      backgroundColor: ColorToken.tertiaryBase.color( brand: selectedBrand,colorScheme: colorScheme))
                            BadgeView(text: "$200 bill credit",
                                      backgroundColor: ColorToken.primaryBase.color( brand: selectedBrand,colorScheme: colorScheme) )
                        }.typographyStyle(.p3,  brand: selectedBrand)
                        
                        HStack {
                            Text("18.5¢/kWh")
                                .typographyStyle(.h2,  brand: selectedBrand)
                            Spacer()
                            Text("price at 2,000 kWh")
                                .typographyStyle(.p1,  brand: selectedBrand)
                                .foregroundColor(.secondary)
                        }
                        
                        LinkComponent(
                            selectedBrand: selectedBrand,
                            text: "View plan details",
                            variant: .text,
                            isInline: false,
                            action: {
                                print("Standalone link tapped")
                            }
                        )
                    }
                    .padding(brandSpacing.containerSpacing.padding.m)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(ColorToken.grayscale000.color(brand: selectedBrand, colorScheme: colorScheme))
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)

                    ButtonComponent(
                        selectedBrand: selectedBrand,
                        title: "Button",
                        variant: .primary
                    ) {
                        print("Secondary tapped")
                    }
                    .padding(.horizontal, brandSpacing.containerSpacing.padding.m)
                }

                .padding(.bottom, brandSpacing.pageLayout.margins.bottom)
                .padding(.horizontal, brandSpacing.pageLayout.margins.horizontal)
                .padding(.top, brandSpacing.pageLayout.margins.top)
                
            }
        }
        .background(Color.gray.opacity(0.05).edgesIgnoringSafeArea(.all))
    }
}


struct PlanChip: View {
    let text: String
    let brandSpacing: BrandSpacing
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, brandSpacing.containerSpacing.padding.xs)
            .padding(.vertical, brandSpacing.containerSpacing.padding.xs)
            .background(Color.gray.opacity(0.15))
            .cornerRadius(4)
    }
}


struct BadgeView: View {
    let text: String
    let backgroundColor: Color
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .cornerRadius(4)
            .foregroundColor(.white)
    }
}


struct SpacingPage_Previews: PreviewProvider {
    static var previews: some View {
        SpacingPage()
    }
}
