//
//  ODCalendarView.swift
//  ODCalendar
//
//  Created by Roman R. on 5/30/22.
//  Copyright © 2022 ondoc. All rights reserved.
//

import SwiftUI

public struct ODCalendarView: View {
    // MARK: - Properties -
    var titleText: String!
    var closeImage: Image!
    var doneButtonText: String!
    @ObservedObject var manager: ODCalendarManager
    var dateSelected: ((Date?) -> Void)
    // MARK: - Init -
    public init(titleText: String,
                closeImage: Image,
                doneButtonText: String,
                manager: ODCalendarManager,
                dateSelected: @escaping ((Date?) -> Void)) {
        self.titleText = titleText
        self.closeImage = closeImage
        self.doneButtonText = doneButtonText
        self.manager = manager
        self.dateSelected = dateSelected
    }
    // MARK: - View -
    public var body: some View {
        Group {
            ZStack {
                Text(titleText)
                    .padding()
                    .font(.headline)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Button {
                        dateSelected(nil)
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(manager.colors.todayBackColor)
                            closeImage
                                .foregroundStyle(manager.colors.activeBackColor)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity)
            }
            
            ODCalendarWeekdayHeader(manager: self.manager)
                .padding()
            
            List {
                ForEach(0..<numberOfMonths(), id: \.self) { index in
                    ODCalendarMonth(manager: self.manager,
                                    monthOffset: index)
                    .withoutSeparators()
                }
            }
            .listStyle(PlainListStyle())
            
            Button {
                dateSelected(manager.selectedDate)
            } label: {
                Text(doneButtonText)
                    .font(.headline)
                    .foregroundColor(manager.selectedDate == nil ? manager.colors.disabledColor : Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
            }
            .disabled(manager.selectedDate == nil)
            .background(manager.selectedDate == nil ?  manager.colors.todayBackColor : manager.colors.activeBackColor)
            .cornerRadius(14)
            .padding(.horizontal)
            .padding(.top)
            .frame(maxWidth: .infinity)
            .background {
                Color.white
                    .edgesIgnoringSafeArea(.bottom)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, y: -2)
            }
        }
    }
    
    // MARK: - Data Source -
    func numberOfMonths() -> Int {
        return manager.calendar.dateComponents([.month], from: manager.minimumDate, to: maximumDateMonthLastDay()).month! + 1
    }
    
    func maximumDateMonthLastDay() -> Date {
        var components = manager.calendar.dateComponents([.year, .month, .day], from: manager.maximumDate)
        components.month! += 1
        components.day = 0
        
        return manager.calendar.date(from: components)!
    }
}

struct TableWithoutSeparatorsModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .listRowSeparator(.hidden)
        } else {
            content
        }
    }
}

extension View {
    func withoutSeparators() -> some View {
        modifier(TableWithoutSeparatorsModifier())
    }
}

struct ODCalendarView_Previews : PreviewProvider {
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
        //manager.colors.activeBackColor = Color(.blue)
        ODCalendarView(titleText: "Дата приема",
                       closeImage: Image(systemName: "xmark"),
                       doneButtonText: "done",
                       manager: manager,
                       dateSelected: { dateSelected in
            print(dateSelected ?? "")
        })
    }
}

