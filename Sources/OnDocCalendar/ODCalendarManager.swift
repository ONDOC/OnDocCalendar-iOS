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
    @Published var titleText: String!
    @Published var rightButtonText: String!
    @Published var doneButtonText: String!
    @Published var activeUIColor: UIColor = .orange
    @Published var disabledUIColor: UIColor = .gray
    @Published var minimumDate: Date = Date()
    @Published var maximumDate: Date = Date()
    @Published var disabledDates: [Date] = [Date]()
    @Published var calendar = Calendar.current
    @Published var selectedDate: Date! = nil
    @Published var startDate: Date! = nil
    @Published var endDate: Date! = nil
    var colors = ODCalendarColorSettings()
    
    // MARK: - Init -
    public init(titleText: String,
                rightButtonText: String,
                doneButtonText: String,
                activeUIColor: UIColor,
                disabledUIColor: UIColor,
                minimumDate: Date,
                maximumDate: Date,
                disabledDates: [Date],
                selectedDate: Date) {
        self.titleText = titleText
        self.rightButtonText = rightButtonText
        self.doneButtonText = doneButtonText
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.disabledDates = disabledDates
        self.activeUIColor = activeUIColor
        self.disabledUIColor = disabledUIColor
        self.selectedDate = selectedDate
        colors.selectedBackColor = Color(activeUIColor)
        colors.disabledColor = Color(disabledUIColor)
        colors.todayBackColor = Color(activeUIColor)
        colors.weekdayHeaderColor = Color(disabledUIColor)
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
