////
////  SpacingTokenManager.swift
////  ComponentLibrary
////
////  Created by UI/UX Development Team  on 1/24/25.
////
import SwiftUI
import os.log

final class SpacingTokenManager: ObservableObject {
    static let shared = SpacingTokenManager()
    @Published private(set) var spacingSystem: SpacingSystem?

    private init() {
        loadTokens()
    }

    private func loadTokens() {
        guard let url = Bundle.main.url(forResource: "SpacingTokens", withExtension: "json") else {
            os_log(.error, "SpacingTokens.json not found in the app bundle.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            spacingSystem = try JSONDecoder().decode(SpacingSystem.self, from: data)
        } catch {
            os_log(.error, "Failed to load or decode SpacingTokens.json: %@", error.localizedDescription)
        }
    }

    func spacing(for brand: Brand) -> BrandSpacing {
        spacingSystem?.brands[brand.identifier] ?? defaultSpacing()
    }

    private func defaultSpacing() -> BrandSpacing {
        BrandSpacing(
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



