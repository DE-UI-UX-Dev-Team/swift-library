//
//  ComponentLibraryApp.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//

import SwiftUI

@main
struct ComponentLibraryApp: App {
    @State private var selectedBrand: Brand = .reliant

    var body: some Scene {
        WindowGroup {
            ComponentLibraryHome()
                .environment(\.brand, selectedBrand)
        }
    }
}

