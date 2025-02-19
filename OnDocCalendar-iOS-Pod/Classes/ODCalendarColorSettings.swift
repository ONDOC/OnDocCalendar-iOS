//
//  ODCalendarColorSettings.swift
//  ODCalendar
//
//  Created by Roman R. on 5/30/22.
//  Copyright © 2022 ondoc. All rights reserved.
//

import Foundation
import SwiftUI

class ODCalendarColorSettings: ObservableObject {
    // Foreground colors
    @Published var textColor: Color = Color.primary
    @Published var todayColor: Color = Color.white
    @Published var activeColor: Color = Color.white
    @Published var disabledColor: Color = Color(hex: "#9B9B9B")
    // Background colors
    @Published var textBackColor: Color = Color.clear
    @Published var todayBackColor: Color = Color(hex: "#F5F5F5")
    @Published var activeBackColor: Color = Color.red
    @Published var disabledBackColor: Color = Color.clear
    // Headers foreground colors
    @Published var weekdayHeaderColor: Color = Color(hex: "#7B7B7B")
    @Published var monthHeaderColor: Color = Color.primary
    // Headers background colors
    @Published var weekdayHeaderBackColor: Color = Color.clear
    @Published var monthBackColor: Color = Color.clear
}

fileprivate extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
