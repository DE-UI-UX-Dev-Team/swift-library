//
//  AnyShapeWrapper.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 2/20/25.
//
import SwiftUI

struct AnyShape: Shape {
    private let pathClosure: @Sendable (CGRect) -> Path
    init<S: Shape>(_ shape: S) { self.pathClosure = { shape.path(in: $0) } }
    func path(in rect: CGRect) -> Path { pathClosure(rect) }
}
