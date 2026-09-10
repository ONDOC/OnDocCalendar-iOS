//
//  ODCalendarManager.swift
//  ODCalendar
//
//  Created by Roman R. on 5/30/22.
//  Copyright © 2022 ondoc. All rights reserved.
//

import SwiftUI

public class ODCalendarManager : ObservableObject {
    // MARK: - Properties -
    @Published var minimumDate: Date = Date()
    @Published var maximumDate: Date = Date()
    @Published var disabledDates: [Date] = [Date]()
    @Published var selectedDate: Date?
    @Published var startDate: Date! = nil
    @Published var endDate: Date! = nil
    @Published var calendar = Calendar.current
    var colors = ODCalendarColorSettings()
    
    // MARK: - Init -
    /// - Parameter locale: locale used to render month and weekday names.
    ///   Pass the locale the app is displayed in, it may differ from the system one.
    public init(minimumDate: Date,
                maximumDate: Date,
                disabledDates: [Date],
                selectedDate: Date?,
                uiColorSheme: UIColor,
                locale: Locale = .current) {
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.disabledDates = disabledDates
        self.selectedDate = selectedDate
        self.calendar = Self.makeCalendar(locale: locale)
        colors.activeBackColor = Color(uiColorSheme)
    }

    private static func makeCalendar(locale: Locale) -> Calendar {
        var calendar = Calendar.current
        calendar.locale = locale
        calendar.firstWeekday = 2 // Monday, regardless of the locale region
        return calendar
    }
    
    // MARK: - Actions -
    func disabledDatesContains(date: Date) -> Bool {
        if let _ = self.disabledDates.first(where: { calendar.isDate($0, inSameDayAs: date) }) {
            return true
        }
        return false
    }
    
    func disabledDatesFindIndex(date: Date) -> Int? {
        return self.disabledDates.firstIndex(where: { calendar.isDate($0, inSameDayAs: date) })
    }
}
