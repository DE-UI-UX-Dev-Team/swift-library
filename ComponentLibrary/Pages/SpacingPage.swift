//
//  SpacingPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/25/25.
//


import SwiftUI

struct PaddingVisualizer: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand
    private func colorToken(_ token: ColorToken) -> Color {
        token.color(brand: brand, colorScheme: colorScheme)
    }
    let name: String
    let padding: CGFloat

    private var color: Color {
        switch name {
        case "None": return colorToken(.primaryBase).opacity(0.1)
        case "XS", "S": return colorToken(.primaryBase).opacity(0.3)
        case "M": return colorToken(.primaryBase).opacity(0.5)
        case "L", "XL": return colorToken(.primaryBase).opacity(0.7)
        case "2XL": return colorToken(.primaryBase).opacity(0.9)
        default: return colorToken(.primaryBase).opacity(0.3)
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            Text(name)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Rectangle()
                .fill(color)
                .cornerRadius(8)
                .frame(height: 50)
                .padding(padding)
                .overlay(
                    Text("\(Int(padding))")
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .bold()
                )
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.1), radius: 4)
        }
    }
}

struct GapVisualizer: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) private var brand
    private func colorToken(_ token: ColorToken) -> Color {
        token.color(brand: brand, colorScheme: colorScheme)
    }
    let name: String
    let gap: CGFloat

    private var color: Color {
        switch name {
        case "None": return colorToken(.tertiaryBase).opacity(0.1)
        case "XS", "S": return colorToken(.tertiaryBase).opacity(0.3)
        case "M": return colorToken(.tertiaryBase).opacity(0.5)
        case "L", "XL": return colorToken(.tertiaryBase).opacity(0.7)
        case "Icon Gap": return colorToken(.tertiaryBase).opacity(0.9)
        default: return Color.green.opacity(0.3)
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            Text(name)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Circle()
                    .fill(color)
                    .frame(width: 20, height: 20)
                Spacer()
                    .frame(width: gap)
                Circle()
                    .fill(color)
                    .frame(width: 20, height: 20)
            }
            .padding()
            .overlay(
                Text("\(Int(gap))")
                    .foregroundColor(.black)
                    .font(.caption)
                    .bold()
            )
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .shadow(color: .gray.opacity(0.1), radius: 4)
        }
    }
}


struct ContainerSpacingVisualizer: View {
    @Environment(\.brand) private var brand
    
    private var brandSpacing: BrandSpacing {
        SpacingTokenManager.shared.spacing(for: brand)
    }
    let spacing: ContainerSpacing

    var body: some View {
        ScrollView {
            VStack(spacing: brandSpacing.pageLayout.sectionSpacing.xl){
            VStack(alignment: .leading) {
                Text(" Container Padding")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 4)
                
                VStack(spacing: 16) {
                    PaddingVisualizer(name: "None", padding: spacing.padding.none)
                    PaddingVisualizer(name: "XS", padding: spacing.padding.xs)
                    PaddingVisualizer(name: "S", padding: spacing.padding.s)
                    PaddingVisualizer(name: "M", padding: spacing.padding.m)
                    PaddingVisualizer(name: "L", padding: spacing.padding.l)
                    PaddingVisualizer(name: "XL", padding: spacing.padding.xl)
                    PaddingVisualizer(name: "2XL", padding: spacing.padding.twoXL)
                }
                
            }
            
                VStack{
                                Text("Container Gaps")
                                    .font(.title3)
                                    .bold()
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        GapVisualizer(name: "None", gap: spacing.gaps.none)
                        GapVisualizer(name: "XS", gap: spacing.gaps.xs)
                        GapVisualizer(name: "S", gap: spacing.gaps.s)
                        GapVisualizer(name: "M", gap: spacing.gaps.m)
                        GapVisualizer(name: "L", gap: spacing.gaps.l)
                        GapVisualizer(name: "XL", gap: spacing.gaps.xl)
                        GapVisualizer(name: "Icon Gap", gap: spacing.gaps.icon)
                    }
                   
                }}
        }.border(Color.green, width: 2)
        }
    }

struct SpacingPage: View {
    @Environment(\.brand) private var brand
    
    private var brandSpacing: BrandSpacing {
        SpacingTokenManager.shared.spacing(for: brand)
    }

    var body: some View {
        ScrollView {
            VStack() {
                ContainerSpacingVisualizer(spacing: brandSpacing.containerSpacing)            }
            .padding(.top, brandSpacing.pageLayout.margins.top)
            .padding(.bottom, brandSpacing.pageLayout.margins.bottom)
            .padding(.horizontal, brandSpacing.pageLayout.margins.horizontal)
            .border(Color.red, width: 2)
            
        }
    }
}
struct SpacingPage_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            SpacingPage()
        }
    }
}




