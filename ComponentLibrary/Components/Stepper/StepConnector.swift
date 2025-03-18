import SwiftUI

struct StepConnector: View, BrandStyleSupport  {
    let isActive: Bool
    let isDotted: Bool
    let isIntermediate: Bool
    let isIntermediateComplete: Bool

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand

    struct BrandConnectorStyle {
        let activeColor: Color
        let inactiveColor: Color

        func getColor(isActive: Bool, isDotted: Bool, isIntermediateComplete: Bool) -> Color {
            return (isActive || (isDotted && isIntermediateComplete)) ? activeColor : inactiveColor
        }
    }

    private var connectorColor: Color {
        let brandStyles: [Brand: BrandConnectorStyle] = [
            .de: BrandConnectorStyle(
                activeColor: colorToken(.grayscale900),
                inactiveColor: colorToken(.grayscale900)
            ),
            .reliant: BrandConnectorStyle(
                activeColor: colorToken(.primaryBase),
                inactiveColor: colorToken(.borderDefaultSecondary)
            )
        ]

        let defaultStyle = BrandConnectorStyle(
            activeColor: colorToken(.borderDefaultPrimary),
            inactiveColor: colorToken(.borderDefaultPrimary)
        )

        return (brandStyles[brand] ?? defaultStyle).getColor(isActive: isActive, isDotted: isDotted, isIntermediateComplete: isIntermediateComplete)
    }

    var body: some View {
        HStack(spacing: 0) {
            if isIntermediate {
                DottedLine()
                    .frame(height: 2)
                    .foregroundColor(connectorColor)
            } else {
                DottedLine(dashed: isDotted)
                    .frame(height: 2)
                    .foregroundColor(connectorColor)
            }
        }
    }
}

struct DottedLine: View {
    var dashed: Bool = true
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height: CGFloat = 2
                path.move(to: CGPoint(x: 0, y: height / 2))
                path.addLine(to: CGPoint(x: width, y: height / 2))
            }
            .stroke(style: StrokeStyle(lineWidth: 2, dash: dashed ? [6,2] : []))
        }
    }
}
