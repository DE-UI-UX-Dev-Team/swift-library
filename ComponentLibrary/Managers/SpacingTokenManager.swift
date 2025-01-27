//
//  SpacingTokenManager.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team  on 1/24/25.
//
import SwiftUI


class SpacingManager {
    static let shared = SpacingManager()
    var spacingSystem: SpacingSystem?

    private init() {
        loadSpacingSystem()
    }

    private func loadSpacingSystem() {
        guard let url = Bundle.main.url(forResource: "SpacingTokens", withExtension: "json") else {
            fatalError("Failed to locate SpacingTokens.json in the app bundle.")
           
        }

        do {
            let data = try Data(contentsOf: url)
            spacingSystem = try JSONDecoder().decode(SpacingSystem.self, from: data)
        } catch {
            fatalError("Failed to load or decode SpacingTokens.json: \(error)")
        }
    }

    func spacing(for brand: String) -> BrandSpacing {
        guard let system = spacingSystem else {
            fatalError("Spacing system is not loaded.")
        }
        return system.brands[brand] ?? defaultSpacing()
    }

    private func defaultSpacing() -> BrandSpacing {
        return BrandSpacing(
            pageLayout: PageLayout(
                margins: Margins(horizontal: 16, top: 24, bottom: 32),
                heights: Heights(
                    mobileSmall: 812, mobileRegular: 852,
                    mobileLarge: 932, tabletPortrait: 1040,
                    tabletLandscape: 768
                ),
                sectionSpacing: SectionSpacing(
                    none: 0, xs: 8, s: 16, m: 16, l: 24,
                    xl: 32, twoXL: 32, threeXL: 32, button: 24
                )
            ),
            containerSpacing: ContainerSpacing(
                padding: ContainerPadding(
                    none: 0, xs: 4, s: 8, m: 16, l: 24, xl: 24, twoXL: 24
                ),
                gaps: ContainerGaps(
                    none: 0, xs: 2, s: 4, m: 8, l: 16, xl: 24, icon: 10
                )
            )
        )
    }
}




struct BrandSpacingKey: EnvironmentKey {
    static let defaultValue: BrandSpacing = SpacingManager.shared.spacing(for: "brandDE")
}

extension EnvironmentValues {
    var brandSpacing: BrandSpacing {
        get { self[BrandSpacingKey.self] }
        set { self[BrandSpacingKey.self] = newValue }
    }
}


struct ApplyBrandSpacing: ViewModifier {
    let brand: String

    func body(content: Content) -> some View {
        let spacing = SpacingManager.shared.spacing(for: brand)
        content.environment(\.brandSpacing, spacing)
    }
}

extension View {
    func applyBrandSpacing(brand: String) -> some View {
        self.modifier(ApplyBrandSpacing(brand: brand))
    }
}


