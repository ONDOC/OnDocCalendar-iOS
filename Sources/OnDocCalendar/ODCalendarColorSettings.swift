//
//  ODCalendarColorSettings.swift
//  ODCalendar
//
//  Created by Roman R. on 5/30/22.
//  Copyright © 2022 ondoc. All rights reserved.
//

import Foundation
import SwiftUI

class ODCalendarColorSettings : ObservableObject {
    // Foreground colors
    @Published var textColor: Color = Color.primary
    @Published var todayColor: Color = Color.white
    @Published var selectedColor: Color = Color.white
    @Published var disabledColor: Color = Color.gray
    @Published var betweenStartAndEndColor: Color = Color.white
    // Background colors
    @Published var textBackColor: Color = Color.clear
    @Published var todayBackColor: Color = Color.gray
    @Published var selectedBackColor: Color = Color.red
    @Published var disabledBackColor: Color = Color.clear
    @Published var betweenStartAndEndBackColor: Color = Color.blue
    // Headers foreground colors
    @Published var weekdayHeaderColor: Color = Color.gray
    @Published var monthHeaderColor: Color = Color.primary
    // Headers background colors
    @Published var weekdayHeaderBackColor: Color = Color.clear
    @Published var monthBackColor: Color = Color.clear
}
