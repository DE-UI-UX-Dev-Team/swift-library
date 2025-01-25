//
//  Untitled.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/24/25.
//
import SwiftUI
import Foundation

// Spacing Design Token Models
struct SpacingSystem: Codable {
    let brands: [String: BrandSpacing]
}

struct BrandSpacing: Codable {
    let pageSpacing: PageSpacing
    let containerSpacing: ContainerSpacing
}

// Page Spacing Tokens
struct PageSpacing: Codable {
    let margins: Margins
    let heights: Heights
    let sectionGaps: SectionGaps
}

struct Margins: Codable {
    let sides, top, bottom: CGFloat
}

struct Heights: Codable {
    let mobileSmall, mobileRegular, mobileLarge: CGFloat
    let tabletPortrait, tabletLandscape: CGFloat
}

struct SectionGaps: Codable {
    let none, xs, s, m, l, xl, twoXL, threeXL, buttonGap: CGFloat
}

// Container Spacing Tokens
struct ContainerSpacing: Codable {
    let padding: ContainerPadding
    let gaps: ContainerGaps
}

struct ContainerPadding: Codable {
    let none, xs, s, m, l, xl, twoXL: CGFloat
}

struct ContainerGaps: Codable {
    let none, xs, s, m, l, xl, iconGap: CGFloat
}
