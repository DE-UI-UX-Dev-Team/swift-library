//
//  Modifiers.swift
//  ComponentLibrary
//
//   Created by UI/UX Development Team on 2/28/25.
//

import SwiftUI

//Page Margins
struct PageMarginModifier: ViewModifier, BrandStyleSupport {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.brand) var brand
    
    
    func body(content: Content) -> some View {
        content
            .padding(.top, brandSpacing.pageLayout.margins.top)
            .padding(.horizontal, brandSpacing.pageLayout.margins.horizontal)
            .padding(.bottom, brandSpacing.pageLayout.margins.bottom)
    }
}


//Underline
struct UnderlineModifier: ViewModifier {
    let applyUnderline: Bool
    let color: Color
    
    func body(content: Content) -> some View {
        if applyUnderline {
            content.underline(true, color: color)
        } else {
            content
        }
    }
}

//Bottom Sheet Modifier
struct AdaptiveSheetModifier<SheetContent: View>: ViewModifier, BrandStyleSupport {
    @Environment(\.brand)  var brand
    @Environment(\.colorScheme)  var colorScheme
    @Binding var isPresented: Bool
    @State private var subHeight: CGFloat = 0
    @State private var isReadyToShow = false
    @State private var showSheet = false

    let sheetContent: () -> SheetContent

    init(isPresented: Binding<Bool>, sheetContent: @escaping () -> SheetContent) {
        _isPresented = isPresented
        self.sheetContent = sheetContent
    }

    func body(content: Content) -> some View {
        let paddedContent = {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    SwiftUI.Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .frame(width: 24, height: 24)
                            .foregroundColor(colorToken(.grayscale600))
                    }
                    .padding(.trailing, brandSpacing.containerSpacing.padding.l)
                }
                .padding(.vertical, brandSpacing.containerSpacing.padding.m)
                
                // Main sheet content
                VStack(alignment: .leading, spacing: 0) {
                    sheetContent()
                        .padding(.bottom, brandSpacing.containerSpacing.padding.l)
                        .padding(.horizontal, brandSpacing.containerSpacing.padding.l)
                }
            }
        }

        return content
            .background(
                paddedContent()
                    .background(
                        GeometryReader { proxy in
                            Color.clear
                                .task(id: proxy.size.height) {
                                    
                                    subHeight = proxy.size.height
                                }
                                    
                        }
                    )
                    .opacity(0.01)
            )
            .sheet(isPresented: $isPresented) {
                paddedContent()
                    .id(subHeight)
                    .presentationDetents([.height(subHeight)])
                    .presentationCornerRadius(16)
            }
    }
}
