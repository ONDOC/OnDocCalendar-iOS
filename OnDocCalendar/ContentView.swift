//
//  ContentView.swift
//  OnDocCalendar
//
//  Created by Roman R. on 5/30/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let manager = ODCalendarManager(titleText: "Title",
                                        rightButtonText: "Right",
                                        doneButtonText: "Done",
                                        minimumDate: Date(),
                                        maximumDate: Date().addingTimeInterval(60*60*24*365), disabledDates: [Date().addingTimeInterval(60*60*24*3),
                                                                                                              Date().addingTimeInterval(60*60*24*4)])
        ODCalendarView(manager: manager) { selectedDate in
                print(selectedDate ?? "")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
    }
}
