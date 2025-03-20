import SwiftUI
import os.log

final class SpacingTokenManager: ObservableObject {
    static let shared = SpacingTokenManager()
    @Published private(set) var spacingSystem: SpacingSystem?

    private init() {
        if case .success(let decoded) = JSONTokenLoader.load(fileName: "SpacingTokens", type: SpacingSystem.self) {
            self.spacingSystem = decoded
            os_log(.info, "✅ Successfully loaded SpacingTokens.json")
        } else {
            os_log(.error, "❌ Failed to load SpacingTokens.json, using default spacing")
            self.spacingSystem = SpacingSystem(brands: [:])
        }
    }

    func spacing(for brand: Brand) -> BrandSpacing {
        spacingSystem?.brands[brand.identifier] ?? defaultSpacing()
    }

    private func defaultSpacing() -> BrandSpacing {
        BrandSpacing(
            pageLayout: PageLayout(
                margins: Margins(horizontal: 16, top: 24, bottom: 32),
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
                    none: 0, xs: 2, s: 4, m: 8, l: 16, xl: 24, twoXL: 32, icon: 10
                )
            )
        )
    }
}
