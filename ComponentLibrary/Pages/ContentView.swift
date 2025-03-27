//
//  ContentView.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//
import SwiftUI

struct ContentView: View , BrandStyleSupport {
        @Environment(\.brand) var brand
        @Environment(\.colorScheme) var colorScheme
        @StateObject private var navigationManager = BottomBarManager()


        private var  bottomBarconfig: BottomBarConfig {
            BottomBarConfigProvider.configurations[brand] ?? DEBottomBarConfig()
        }

    var body: some View {
        BottomBar(
                    selectedTab: $navigationManager.selectedTab,
                    isBottomBarVisible: $navigationManager.isBottomBarVisible
                ) { selectedTab in
                    bottomBarconfig.pageMap[selectedTab]?() ?? AnyView(Text("Unknown Page"))
                }
        .environmentObject(navigationManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper { brand in
            ContentView()

        }
    }
}




