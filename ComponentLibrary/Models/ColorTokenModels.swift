//
//  ColorTokenModels.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//

import SwiftUI

struct ThemeColors: Decodable {
    let colors: [String: String]
}


struct BrandThemes: Decodable {
    let light: ThemeColors
    let dark: ThemeColors
}

struct AllBrandTokens: Decodable {
    let brandDE: BrandThemes
    let brandReliant: BrandThemes

}


enum ColorToken: String {
    //Shared token list
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
    case transparent
    case pageFillGrayDefault
    case pageFillGray1
    case pageFillGray2
    case containerFillGrayDefault
    case containerFillGray1
    case containerFillGray2
    case containerFillGray3
    case containerFillGrayInverse
    case containerFillPrimaryDefault
    case containerFillPrimaryBrand
    case containerFillPrimary1
    case containerFillSecondaryDefault
    case containerFillSecondaryBrand
    case containerFillTertiaryDefault
    case containerFillTertiaryBrand
    case containerFillTertiary1
    case containerFillStatusError
    case containerFillStatusSuccess
    case containerFillStatusInfo
    case containerFillStatusWarning
    case containerFillStatusDisabled
    case borderDefaultPrimary
    case borderDefaultSecondary
    case borderStatusError
    case borderStatusSuccess
    case borderStatusInfo
    case borderStatusWarning
    case borderStatusDisabled
    case iconDefaultAccessible
    case iconDefaultInverse
    case iconDefaultPrimary
    case iconFeedbackDisabled
    case iconFeedbackError
    case iconFeedbackSuccess
    case iconFeedbackInfo
    case iconFeedbackWarning
    
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
    case pageFillGray3
    case pageFillPrimaryBrand
    case pageFillPrimaryDefault
    case pageFillSecondaryDefault
    case pageFillSecondaryBrand
    case containerFillPastelAlt
    case containerFillPastelAlt2
    case containerFillSecondaryPressed
    case containerFillTertiaryBrandAlt
    case containerFillGreenEco
    case containerFillStatusErrorDark
    case containerFillStatusSuccessDark
    case borderStatusErrorBar
    case borderStatusSuccessBar
    case borderStateDisabledAlt
    case borderStateInactive
    case borderStateActive
    case borderStateFocus
    case iconStateInactive
    case iconFeedbackActionable
    case iconFeedbackErrorCustom
    case iconFeedbackSuccessCustom
    case iconFeedbackInfoCustom
    case iconFeedbackWarningCustom
    case iconIllustrativePrimary1
    case iconIllustrativePrimary2
    case iconIllustrativeSecondary
    case iconIllustrativeTertiary
    case iconIllustrativeEcoGreen
    case iconIllustrativeOutline
    
    
    // Reliant only
    case greenLighter
    case yellowLighter
    case borderDefaultSecondaryAlt
    case borderDefaultTertiary
    case iconDefaultPrimaryAlt
    case iconDefaultSecondary
    case iconDefaultSecondaryAlt
    case iconDefaultTertiary
    case iconDefaultTertiaryAlt
    case iconDefaultEcoGreen
    case iconDefaultGreenUI
    case iconDefaultSolar
    
    
    
    
    func color(brand: Brand, colorScheme: ColorScheme) -> Color {
            return ColorTokenManager.shared.color(
                for: brand,
                tokenName: self.rawValue,
                colorScheme: colorScheme
            )
        }
    
}




