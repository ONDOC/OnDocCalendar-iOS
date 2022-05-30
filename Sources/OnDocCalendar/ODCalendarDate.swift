//
//  ODCalendarDate.swift
//  ODCalendar
//
//  Created by Roman R. on 5/30/22.
//  Copyright © 2022 ondoc. All rights reserved.
//

import SwiftUI

struct ODCalendarDate {
    // MARK: - Properties -
    var date: Date
    let manager: ODCalendarManager
    var isDisabled: Bool = false
    var isToday: Bool = false
    var isSelected: Bool = false
    
    // MARK: - Init -
    init(date: Date,
         manager: ODCalendarManager,
         isDisabled: Bool,
         isToday: Bool,
         isSelected: Bool) {
        self.date = date
        self.manager = manager
        self.isDisabled = isDisabled
        self.isToday = isToday
        self.isSelected = isSelected
    }
    
    // MARK: - Actions -
    func getText() -> String {
        let day = formatDate(date: date, calendar: self.manager.calendar)
        return day
    }
    
    func getTextColor() -> Color {
        var textColor = manager.colors.textColor
        if isDisabled {
            textColor = manager.colors.disabledColor
        } else if isSelected {
            textColor = manager.colors.selectedColor
        } else if isToday {
            textColor = manager.colors.todayColor
        }
        return textColor
    }
    
    func getBackgroundColor() -> Color {
        var backgroundColor = manager.colors.textBackColor
        if isToday {
            backgroundColor = manager.colors.todayBackColor.opacity(0.25)
        }
        if isDisabled {
            backgroundColor = manager.colors.disabledBackColor
        }
        if isSelected {
            backgroundColor = manager.colors.selectedBackColor
        }
        return backgroundColor
    }
    
    func getFontWeight() -> Font.Weight {
        var fontWeight = Font.Weight.medium
        if isDisabled {
            fontWeight = Font.Weight.medium
        } else if isSelected {
            fontWeight = Font.Weight.semibold
        } else if isToday {
            fontWeight = Font.Weight.bold
        }
        return fontWeight
    }
    
    // MARK: - Date Formats -
    func formatDate(date: Date,
                    calendar: Calendar) -> String {
        let formatter = dateFormatter()
        return stringFrom(date: date, formatter: formatter, calendar: calendar)
    }
    
    func dateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "d"
        return formatter
    }
    
    func stringFrom(date: Date,
                    formatter: DateFormatter,
                    calendar: Calendar) -> String {
        if formatter.calendar != calendar {
            formatter.calendar = calendar
        }
        return formatter.string(from: date)
    }
}

