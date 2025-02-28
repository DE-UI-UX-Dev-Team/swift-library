//
//  PageMaxHeights.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/28/25.
//

import SwiftUI

// dynamic heights (iOS only)
struct PageMaxHeights {
    @Environment(\.brand) private static var brand
    
    private static var brandSpacing: BrandSpacing {
        SpacingTokenManager.shared.spacing(for: brand)
    }
    
    static func heightForDevice() -> CGFloat {
        let screenSize = UIScreen.main.bounds.size
        
        let isLandscape = screenSize.width > screenSize.height
        
    
        if UIDevice.current.userInterfaceIdiom == .phone {
            if screenSize.height <= 667 {
                return brandSpacing.pageLayout.heights.mobileSmall
            } else if screenSize.height <= 844 {
                return brandSpacing.pageLayout.heights.mobileRegular
            } else {
                return brandSpacing.pageLayout.heights.mobileLarge
            }
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            if isLandscape {
                return brandSpacing.pageLayout.heights.tabletLandscape
            } else {
                return brandSpacing.pageLayout.heights.tabletPortrait
            }
        }
        
        return brandSpacing.pageLayout.heights.mobileRegular
    }
}
