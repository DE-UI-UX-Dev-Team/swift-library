import Foundation
import CoreGraphics 

struct IconBrandTokens: Codable {
    let brands: [String: BrandIconTokens]
}

struct BrandIconTokens: Codable {
    let utility: [String: CGFloat]
    let illustrative: [String: CGFloat]
}
