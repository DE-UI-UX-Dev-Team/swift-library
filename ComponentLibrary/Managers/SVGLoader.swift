import SVGKit
import Foundation
import UIKit

class SVGLoader {
    static let shared = SVGLoader()

    private init() {}

    func loadSVG(named svgName: String, frameSize: CGFloat) -> SVGKImage? {
        guard let path = Bundle.main.path(forResource: svgName, ofType: "svg") else {
            return nil
        }

        do {
           
            var svgString = try String(contentsOfFile: path, encoding: .utf8)
            svgString = svgString
                .replacingOccurrences(of: #"width="\d+(\.\d+)?""#, with: "", options: .regularExpression)
                .replacingOccurrences(of: #"height="\d+(\.\d+)?""#, with: "", options: .regularExpression)

            guard let svgData = svgString.data(using: .utf8) else {
                return nil
            }

            guard let svgImage = SVGKImage(data: svgData) else {
                return nil
            }

            if svgImage.caLayerTree == nil {
                return nil
            }

            svgImage.size = CGSize(width: frameSize, height: frameSize)
            return svgImage
        } catch {
            return nil
        }
    }
}

