import SwiftUI
import SVGKit

struct Icon: View {
    let iconName: String
    let type: IconType
    let size: IconSize
    let color: ColorToken 

    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.brand) private var brand

    var body: some View {
        let iconSize = IconTokenManager.shared.getIconSize(for: brand.identifier, type: type, size: size) ?? 24
        if !IconTokenManager.shared.iconExists(for: brand.identifier, iconName: iconName) {
            return AnyView(EmptyView())
        }

        return AnyView(
            SVGImageView(
                svgName: iconName,
                frameSize: iconSize,
                brand: brand,
                colorToken: color, // Pass the ColorToken
                iconType: type
            )
            .frame(width: iconSize, height: iconSize)
        )
    }
}

struct SVGImageView: UIViewRepresentable {
    let svgName: String
    let frameSize: CGFloat
    let brand: Brand
    let colorToken: ColorToken // Now using ColorToken instead of SwiftUI Color
    let iconType: IconType

    @Environment(\.colorScheme) private var colorScheme

    func makeUIView(context: Context) -> SVGKFastImageView {
        guard let svgImage = SVGLoader.shared.loadSVG(named: svgName, frameSize: frameSize) else {
            return SVGKFastImageView(svgkImage: SVGKImage())
        }
        
        let imageView = SVGKFastImageView(svgkImage: svgImage) ?? SVGKFastImageView()
        return imageView
    }

    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        let resolvedColor = colorToken.color(brand: brand, colorScheme: colorScheme).toUIColor()
        let strokeColor = ColorToken.grayscale900.color(brand: brand, colorScheme: colorScheme).toUIColor()

        if let rootLayer = uiView.image?.caLayerTree {
            if iconType == .illustrative {
                applyColorToStroke(layer: rootLayer, color: strokeColor)
                applyFillColorToClass(layer: rootLayer, idName: "st0", color: resolvedColor)
            } else if iconType == .utility {
                applyColorToUtilityIcons(layer: rootLayer, color: resolvedColor)
            }
        }
    }

    private func applyFillColorToClass(layer: CALayer, idName: String, color: UIColor) {
        if let shapeLayer = layer as? CAShapeLayer, shapeLayer.name == idName {
            shapeLayer.fillColor = color.cgColor
            shapeLayer.setNeedsDisplay()
        }
        layer.sublayers?.forEach { applyFillColorToClass(layer: $0, idName: idName, color: color) }
    }

    private func applyColorToUtilityIcons(layer: CALayer, color: UIColor) {
        if let shapeLayer = layer as? CAShapeLayer {
            shapeLayer.fillColor = color.cgColor
            shapeLayer.strokeColor = color.cgColor
            shapeLayer.setNeedsDisplay()
        }
        layer.sublayers?.forEach { applyColorToUtilityIcons(layer: $0, color: color) }
    }

    private func applyColorToStroke(layer: CALayer, color: UIColor) {
        if let shapeLayer = layer as? CAShapeLayer {
            shapeLayer.fillColor = color.cgColor
            shapeLayer.strokeColor = color.cgColor
            shapeLayer.setNeedsDisplay()
        }
        layer.sublayers?.forEach { applyColorToStroke(layer: $0, color: color) }
    }
}

