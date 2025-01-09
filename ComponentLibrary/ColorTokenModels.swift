//
//  ColorTokenModels.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/9/25.
//

import SwiftUI

struct ThemeColors: Decodable {
    let colors: [String: String]
}

struct ColorTokens: Decodable {
    let light: ThemeColors
    let dark: ThemeColors
}
