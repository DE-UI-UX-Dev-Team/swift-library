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
    case reliant
    var identifier: String {
        switch self {
        case .de: return "brandDE"
        case .reliant: return "brandReliant"

        }
    }

    static func from(identifier: String) -> Brand? {
        return Brand.allCases.first { $0.identifier == identifier }
    }
}
