//
//  NavigationManager.swift
//  ComponentLibrary
//
//  Created by susan ruan on 3/26/25.
//

import SwiftUI



class BottomBarManager: ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var isBottomBarVisible: Bool = true
}
