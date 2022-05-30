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
    var cellWidth: CGFloat
    var cellHeight: CGFloat
    
    // MARK: - View -
    var body: some View {
        Text(date.getText())
            .fontWeight(date.getFontWeight())
            .foregroundColor(date.getTextColor())
            .frame(width: cellWidth, height: cellHeight)
            .font(.headline)
            .background(date.getBackgroundColor())
            .clipShape(Capsule())
    }
}

struct ODCalendarCell_Previews : PreviewProvider {
    static var previews: some View {
        let manager = ODCalendarManager(titleText: "Title",
                                        rightButtonText: "Right",
                                        doneButtonText: "Done",
                                        minimumDate: Date(),
                                        maximumDate: Date().addingTimeInterval(60*60*24*365), disabledDates: [Date().addingTimeInterval(60*60*24*3),
                                                                                                              Date().addingTimeInterval(60*60*24*4)])
        Group {
            ODCalendarCell(date: ODCalendarDate(date: Date(),
                                                manager: manager,
                                                isDisabled: false,
                                                isToday: false,
                                                isSelected: false),
                           cellWidth: CGFloat(32), cellHeight: CGFloat(22))
                .previewDisplayName("Control")
            ODCalendarCell(date: ODCalendarDate(date: Date(),
                                                manager: manager,
                                                isDisabled: true,
                                                isToday: false,
                                                isSelected: false),
                           cellWidth: CGFloat(32), cellHeight: CGFloat(22))
                .previewDisplayName("Disabled Date")
            ODCalendarCell(date: ODCalendarDate(date: Date(),
                                                manager: manager,
                                                isDisabled: false,
                                                isToday: true,
                                                isSelected: false),
                           cellWidth: CGFloat(32), cellHeight: CGFloat(22))
                .previewDisplayName("Today")
            ODCalendarCell(date: ODCalendarDate(date: Date(),
                                                manager: manager,
                                                isDisabled: false,
                                                isToday: false,
                                                isSelected: true),
                           cellWidth: CGFloat(32), cellHeight: CGFloat(22))
                .previewDisplayName("Selected Date")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

