//
//  ReliantSpacingPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/25/25.
//


import SwiftUI


struct ReliantPaddingVisualizer: View {
    let name: String
    let padding: CGFloat

    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
            Rectangle()
                .fill(Color.blue.opacity(0.3))
                .frame(height: 50)
                .padding(padding)
                .overlay(
                    Text("\(String(format: "%.0f", padding))")
                        .foregroundColor(.blue)
                        .bold()
                )
        }
    }
}

struct ReliantGapVisualizer: View {
    let name: String
    let gap: CGFloat

    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
            HStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                Spacer()
                    .frame(width: gap)
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
            }
            .padding()
            .overlay(
                Text("\(String(format: "%.0f", gap))")
                    .foregroundColor(.green)
                    .bold()
            )
        }
    }
}

struct ReliantContainerSpacingVisualizer: View {
    let spacing: ContainerSpacing

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Reliant Container Padding")
                    .font(.title2)
                    .bold()

                VStack(spacing: 16) {
                    ReliantPaddingVisualizer(name: "None", padding: spacing.padding.none)
                    ReliantPaddingVisualizer(name: "XS", padding: spacing.padding.xs)
                    ReliantPaddingVisualizer(name: "S", padding: spacing.padding.s)
                    ReliantPaddingVisualizer(name: "M", padding: spacing.padding.m)
                    ReliantPaddingVisualizer(name: "L", padding: spacing.padding.l)
                    ReliantPaddingVisualizer(name: "XL", padding: spacing.padding.xl)
                    ReliantPaddingVisualizer(name: "2XL", padding: spacing.padding.twoXL)
                }

                Text("Container Gaps")
                    .font(.title2)
                    .bold()

                VStack(spacing: 16) {
                    ReliantGapVisualizer(name: "None", gap: spacing.gaps.none)
                    ReliantGapVisualizer(name: "XS", gap: spacing.gaps.xs)
                    ReliantGapVisualizer(name: "S", gap: spacing.gaps.s)
                    ReliantGapVisualizer(name: "M", gap: spacing.gaps.m)
                    ReliantGapVisualizer(name: "L", gap: spacing.gaps.l)
                    ReliantGapVisualizer(name: "XL", gap: spacing.gaps.xl)
                    ReliantGapVisualizer(name: "Icon Gap", gap: spacing.gaps.icon)
                }
            }
            .padding()
        }
    }
}

struct ReliantContainerSpacingPage: View {

    @State private var selectedBrand: Brand = .reliant
    @State private var spacing: ContainerSpacing = SpacingTokenManager.shared.spacing(for: .reliant).containerSpacing

    var body: some View {
        VStack {

            ReliantContainerSpacingVisualizer(spacing: spacing)
                .onChange(of: selectedBrand) {
                    spacing = SpacingTokenManager.shared.spacing(for: selectedBrand).containerSpacing
                }

        }
    }
}

struct ReliantContainerSpacingPage_Previews: PreviewProvider {
    static var previews: some View {
        ReliantContainerSpacingPage()
    }
}




