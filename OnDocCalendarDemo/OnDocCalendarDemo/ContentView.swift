//
//  ContentView.swift
//  OnDocCalendarDemo
//
//  Created by Roman R. on 5/30/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Integration Example
        // Properties for manager
        let disabledDates = [Date().addingTimeInterval(86400 * 3),
                             Date().addingTimeInterval(86400 * 5),
                             Date().addingTimeInterval(86400 * 10)] // Not available dates - for example 3, 5, 10 days ahead
        let minimumDate = Date() // Minimum today
        let maximumDate = Date().addingTimeInterval(86400 * 365) // Year ahead
        let selectedDate = Date() // Optional, can be nil
        let uiColorSheme = UIColor.orange // App color
        // Create manager
        let manager = ODCalendarManager(minimumDate: minimumDate,
                                        maximumDate: maximumDate,
                                        disabledDates: disabledDates,
                                        selectedDate: selectedDate,
                                        uiColorSheme: uiColorSheme)
        // Properties for View
        let titleText = "appointment_date"
        let rightButtonText = "Сбросить"
        let doneButtonText = "Done"
        // Create View
        ODCalendarView(titleText: titleText,
                       rightButtonText: rightButtonText,
                       doneButtonText: doneButtonText,
                       manager: manager,
                       dateSelected: { dateSelected in
            if let dateSelected = dateSelected {
                print(dateSelected)
            }
            else {
                print("No selected date")
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
