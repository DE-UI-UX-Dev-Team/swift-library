//
//  Untitled.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/24/25.
//
import SwiftUI
import Foundation


struct SpacingSystem: Codable {
    let brands: [String: BrandSpacing]
}

struct BrandSpacing: Codable {
    let pageLayout: PageLayout
    let containerSpacing: ContainerSpacing
}

struct PageLayout: Codable {
    let margins: Margins
    let heights: Heights
    let sectionSpacing: SectionSpacing
}

struct Margins: Codable {
    let horizontal, top, bottom: CGFloat
}

struct Heights: Codable {
    let mobileSmall, mobileRegular, mobileLarge: CGFloat
    let tabletPortrait, tabletLandscape: CGFloat
}

struct SectionSpacing: Codable {
    let none, xs, s, m, l, xl, twoXL, threeXL, button: CGFloat
}

struct ContainerSpacing: Codable {
    let padding: ContainerPadding
    let gaps: ContainerGaps
}

struct ContainerPadding: Codable {
    let none, xs, s, m, l, xl, twoXL: CGFloat
}

struct ContainerGaps: Codable {
    let none, xs, s, m, l, xl, icon: CGFloat
}
