import SwiftUI

enum ActionHandler {
    
    static func navigate(
        to destination: AnyView,
        navigateTo: Binding<AnyView?>,
        isNavigationActive: Binding<Bool>
    ) {
        print("Navigating to destination")
        navigateTo.wrappedValue = destination
        isNavigationActive.wrappedValue = true
    }
    
    static func downloadPDF(from url: URL) {
        print("Attempting to open PDF: \(url)")
        UIApplication.shared.open(url)
    }
    
    static func showBottomSheet(
        content: @escaping () -> AnyView,
        activeSheet: Binding<SheetWrapper?>,
        show: Binding<Bool>
    ) {
        activeSheet.wrappedValue = SheetWrapper { _ in content() }
        show.wrappedValue = true
    }
}

