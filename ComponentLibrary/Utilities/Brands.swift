//
//  Brands.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/12/25.
//

import SwiftUI
import Foundation


 
// Represents different brands in the component library.
enum Brand: String, CaseIterable {
    case de
    case reliant // Example new brand

 
    /// Returns the brand's identifier as used in JSON.
    var identifier: String {
        switch self {
        case .de: return "brandDE"
        case .reliant: return "brandReliant" // Automatically maps to JSON key

        }
    }
 
    // Creates a `Brand` from its identifier string.
    // - Parameter identifier: The string identifier ("brandDE").
    // - Returns: The corresponding `Brand` enum case, or `nil` if not found.
    static func from(identifier: String) -> Brand? {
        return Brand.allCases.first { $0.identifier == identifier }
    }
}
