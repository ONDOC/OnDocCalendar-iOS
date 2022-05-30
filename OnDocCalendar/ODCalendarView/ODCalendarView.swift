//
//  ODCalendarView.swift
//  ODCalendar
//
//  Created by Roman R. on 5/30/22.
//  Copyright © 2022 ondoc. All rights reserved.
//

import SwiftUI

struct ODCalendarView: View {
    // MARK: - Properties -
    @ObservedObject var manager: ODCalendarManager
    var dateSelected: ((Date?) -> Void)
    
    // MARK: - View -
    var body: some View {
        Group {
            HStack(alignment: .center, spacing: 0) {
                Button {
                    dateSelected(nil)
                } label: {
                    Image(systemName: "xmark")
                        .renderingMode(.template)
                            .foregroundColor(manager.colors.selectedBackColor)
                            .frame(width: 32, height: 32)
                }
                .background(manager.colors.disabledColor)
                .clipShape(Circle())
                Spacer()
                Text(manager.titleText)
                    .padding()
                    .font(.headline)
                Spacer()
                Button {
                    manager.selectedDate = nil
                } label: {
                    Text(manager.rightButtonText)
                        .font(.headline)
                        .foregroundColor(manager.colors.selectedBackColor)
                }
                .padding(.top, 15)
                .padding(.bottom, 15)
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .frame(maxWidth: .infinity)
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
            
            VStack {
                Divider()
                    .shadow(color: .gray, radius: 3, x: 0, y: 6)
                    .padding(.bottom, 15)
                
                    Button(action: {
                        dateSelected(manager.selectedDate)
                    }) {
                        HStack {
                            Spacer()
                            Text(manager.doneButtonText)
                                .font(.headline)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                    }
                    .padding()
                    .disabled(manager.selectedDate == nil)
                    .frame(maxWidth: .infinity)
                    .background(manager.selectedDate == nil ?  manager.colors.disabledColor : manager.colors.selectedBackColor)
                    .cornerRadius(15)
                
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .frame(maxWidth: .infinity)
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
        let manager = ODCalendarManager(titleText: "Title",
                                        rightButtonText: "Right",
                                        doneButtonText: "Done",
                                        minimumDate: Date(),
                                        maximumDate: Date().addingTimeInterval(60*60*24*365), disabledDates: [Date().addingTimeInterval(60*60*24*3),
                                                                                                              Date().addingTimeInterval(60*60*24*4)])
        Group {
            ODCalendarView(manager: manager) { dateSelected in
                print(dateSelected ?? "")
            }
        }
    }
}

