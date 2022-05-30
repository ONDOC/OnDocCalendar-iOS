//
//  ODCalendarWeekdayHeader.swift
//  ODCalendar
//
//  Created by Roman R. on 5/30/22.
//  Copyright © 2022 ondoc. All rights reserved.
//

import SwiftUI

struct ODCalendarWeekdayHeader : View {
    // MARK: - Properties -
    var manager: ODCalendarManager
     
    // MARK: - View -
    var body: some View {
        HStack(alignment: .center) {
            ForEach(self.getWeekdayHeaders(calendar: self.manager.calendar),
                    id: \.self) { weekday in
                Text(weekday.uppercased())
                    .font(.body)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(self.manager.colors.weekdayHeaderColor)
                
            }
        }
        .background(manager.colors.weekdayHeaderBackColor)
    }
    
    func getWeekdayHeaders(calendar: Calendar) -> [String] {
        let formatter = DateFormatter()
        var weekdaySymbols = formatter.shortStandaloneWeekdaySymbols
        let weekdaySymbolsCount = weekdaySymbols?.count ?? 0
        for _ in 0 ..< (1 - calendar.firstWeekday + weekdaySymbolsCount){
            let lastObject = weekdaySymbols?.last
            weekdaySymbols?.removeLast()
            weekdaySymbols?.insert(lastObject!, at: 0)
        }
        return weekdaySymbols ?? []
    }
}

struct ODCalendarWeekdayHeader_Previews : PreviewProvider {
    static var previews: some View {
        let manager = ODCalendarManager(titleText: "Title",
                                        rightButtonText: "Right",
                                        doneButtonText: "Done",
                                        activeUIColor: UIColor.red,
                                        disabledUIColor: UIColor.lightGray,
                                        minimumDate: Date(),
                                        maximumDate: Date().addingTimeInterval(60*60*24*365), disabledDates: [Date().addingTimeInterval(60*60*24*3),
                                                                                                              Date().addingTimeInterval(60*60*24*4)], selectedDate: Date())
        
        ODCalendarWeekdayHeader(manager: manager)
    }
}

