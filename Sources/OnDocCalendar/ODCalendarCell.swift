//
//  ODCalendarCell.swift
//  ODCalendarCell
//
//  Created by Roman R. on 5/30/22.
//  Copyright © 2022 ondoc. All rights reserved.
//

import SwiftUI

struct ODCalendarCell: View {
    // MARK: - Properties -
    var date: ODCalendarDate
    var cellHeight: CGFloat
    // MARK: - View -
    var body: some View {
        Text(date.getText())
            .fontWeight(date.getFontWeight())
            .foregroundColor(date.getTextColor())
            .frame(height: cellHeight)
            .frame(maxWidth: .infinity)
            .font(.headline)
            .background(date.getBackgroundColor())
            .clipShape(Capsule())
    }
}

struct ODCalendarCell_Previews : PreviewProvider {
    static var previews: some View {
        let disabledDates = [Date().addingTimeInterval(60 * 60 * 24 * 3),
                             Date().addingTimeInterval(60 * 60 * 24 * 5),
                             Date().addingTimeInterval(60 * 60 * 24 * 10)] // Disabled 3, 5, 10 days ahead
        let minimumDate = Date() // Minimum today
        let maximumDate = Date().addingTimeInterval(60 * 60 * 24 * 365) // Year ahead
        let selectedDate = Date() // Optional, can be nil
        let uiColorSheme = UIColor.orange
        // Create manager
        let manager = ODCalendarManager(minimumDate: minimumDate,
                                        maximumDate: maximumDate,
                                        disabledDates: disabledDates,
                                        selectedDate: selectedDate,
                                        uiColorSheme: uiColorSheme)
        Group {
            ODCalendarCell(date: ODCalendarDate(date: Date(),
                                                manager: manager,
                                                isDisabled: false,
                                                isToday: false,
                                                isSelected: false),
                           cellHeight: CGFloat(22))
                .previewDisplayName("Control")
            ODCalendarCell(date: ODCalendarDate(date: Date(),
                                                manager: manager,
                                                isDisabled: true,
                                                isToday: false,
                                                isSelected: false),
                           cellHeight: CGFloat(22))
                .previewDisplayName("Disabled Date")
            ODCalendarCell(date: ODCalendarDate(date: Date(),
                                                manager: manager,
                                                isDisabled: false,
                                                isToday: true,
                                                isSelected: false),
                           cellHeight: CGFloat(22))
                .previewDisplayName("Today")
            ODCalendarCell(date: ODCalendarDate(date: Date(),
                                                manager: manager,
                                                isDisabled: false,
                                                isToday: false,
                                                isSelected: true),
                           cellHeight: CGFloat(22))
                .previewDisplayName("Selected Date")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

