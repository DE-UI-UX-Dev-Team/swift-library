//
//  DeSpacingPage.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/24/25.
//
import SwiftUI


struct DePaddingVisualizer: View {
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

struct DeGapVisualizer: View {
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

struct DeContainerSpacingVisualizer: View {
    let spacing: ContainerSpacing

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("DE Container Padding")
                    .font(.title2)
                    .bold()

                VStack(spacing: 16) {
                    DePaddingVisualizer(name: "None", padding: spacing.padding.none)
                    DePaddingVisualizer(name: "XS", padding: spacing.padding.xs)
                    DePaddingVisualizer(name: "S", padding: spacing.padding.s)
                    DePaddingVisualizer(name: "M", padding: spacing.padding.m)
                    DePaddingVisualizer(name: "L", padding: spacing.padding.l)
                    DePaddingVisualizer(name: "XL", padding: spacing.padding.xl)
                    DePaddingVisualizer(name: "2XL", padding: spacing.padding.twoXL)
                }

                Text("Container Gaps")
                    .font(.title2)
                    .bold()

                VStack(spacing: 16) {
                    DeGapVisualizer(name: "None", gap: spacing.gaps.none)
                    DeGapVisualizer(name: "XS", gap: spacing.gaps.xs)
                    DeGapVisualizer(name: "S", gap: spacing.gaps.s)
                    DeGapVisualizer(name: "M", gap: spacing.gaps.m)
                    DeGapVisualizer(name: "L", gap: spacing.gaps.l)
                    DeGapVisualizer(name: "XL", gap: spacing.gaps.xl)
                    DeGapVisualizer(name: "Icon Gap", gap: spacing.gaps.icon)
                }
            }
            .padding()
        }
    }
}

struct DeContainerSpacingPage: View {
    @State private var selectedBrand: String = "brandDE"
    @State private var spacing: ContainerSpacing = SpacingManager.shared.spacing(for: "brandDE").containerSpacing

    var body: some View {
        VStack {
            DeContainerSpacingVisualizer(spacing: spacing)
                .onChange(of: selectedBrand) {
                    spacing = SpacingManager.shared.spacing(for: selectedBrand).containerSpacing
                }

        }
    }
}

struct DeContainerSpacingPage_Previews: PreviewProvider {
    static var previews: some View {
        DeContainerSpacingPage()
    }
}




