//
//  ColorToken.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/9/25.
//


import SwiftUI

enum ColorToken: String {
    //Shared token list as cases
    case primaryBase
    case primaryDarkest
    case primaryLighter
    case primaryLightest
    case secondaryBase
    case secondaryLighter
    case secondaryLightest
    case tertiaryBase
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
    case borderStatusError
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
    
    //DE only
    case primaryDark
    case primaryDarker
    case primaryLight
    case secondaryDark
    case secondaryDarker
    case secondaryDarkest
    case secondaryLight
    case tertiaryDark
    case tertiaryDarker
    
    // Reliant only
    case greenLighter
    case yellowLighter
    
    
    func color(brand: String, colorScheme: ColorScheme) -> Color {
            return ColorTokenManager.shared.color(
                for: brand,
                tokenName: self.rawValue,
                colorScheme: colorScheme
            )
        }
    
}
