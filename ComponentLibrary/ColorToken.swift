//
//  ColorToken.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/9/25.
//


import SwiftUI

enum ColorToken: String {
    // List all token names as cases:
    case primaryBase
    case primaryDark
    case primaryDarker
    case primaryDarkest
    case primaryLight
    case primaryLighter
    case primaryLightest
    case secondaryBase
    case secondaryDark
    case secondaryDarker
    case secondaryDarkest
    case secondaryLight
    case secondaryLighter
    case secondaryLightest
    case tertiaryBase
    case tertiaryDark
    case tertiaryDarker
    case tertiaryDarkest
    case tertiaryLighter
    case tertiaryLightest
    case redAccessible
    case redBase
    case redLight
    case greenAccessible
    case greenBase
    case greenEco
    case greenLight
    case yellowAccessible
    case yellowBase
    case yellowLight
    case grayscale000
    case grayscale100
    case grayscale200
    case grayscale300
    case grayscale400
    case grayscale500
    case grayscale600
    case grayscale700
    case grayscale800
    case grayscale900
    
    case pageFillGrayDefault
    case pageFillGrayLighter
    case pageFillGrayLight
    case pageFillPrimaryBrand
    case containerFillGrayDefault
    case containerFillGray1
    case containerFillGray2
    case containerFillPrimaryDefault
    case containerFillPrimaryBrand
    case containerFillPrimary1
    case containerFillPrimary2
    case containerFillPrimary3
    case containerFillSecondaryDefault
    case containerFillSecondaryBrand
    case containerFillSecondary1
    case containerFillSecondary2
    case containerFillSecondary3
    case containerFillSecondary4
    case containerFillTertiaryDefault
    case containerFillTertiaryBrand
    case containerFillTertiary1
    case containerFillStatusSuccess
    case containerFillStatusInfo
    case containerFillStatusWarning
    case containerFillStatusDisabled
    case borderDefaultPrimarycase
    case borderDefaultSecondary
    case borderDefaultTertiary
    case borderStatusSuccess
    case borderStatusInfo
    case borderStatusWarning
    case borderStatusDisabled
    case iconDefaultAccessible
    case iconDefaultInverse
    case iconDefaultPrimary
    case iconDefaultPrimaryAlt
    case iconDefaultSecondary
    case iconDefaultSecondaryAlt
    case iconDefaultTertiary
    case iconDefaultTertiaryAlt
    case iconDefaultEcoGreen
    case iconFeedbackError
    case iconFeedbackSuccess
    case iconFeedbackInfo
    case iconFeedbackWarning
    case iconFeedbackDisabled
    
    // If you have 100 tokens, just keep listing them here.
    
    /// Convenience to retrieve the SwiftUI `Color` using the manager.
    func color(_ colorScheme: ColorScheme) -> Color {
        return ColorTokenManager.shared.color(for: self.rawValue, colorScheme: colorScheme)
    }
}
