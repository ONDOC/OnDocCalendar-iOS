# OnDocCalendar
```swift
// Calendar
        let disabledDates = [Date().addingTimeInterval(60 * 60 * 24 * 3),
                             Date().addingTimeInterval(60 * 60 * 24 * 5),
                             Date().addingTimeInterval(60 * 60 * 24 * 10)] // Disabled 3, 5, 10 days ahead
        let minimumDate = Date() // Minimum today
        let maximumDate = Date().addingTimeInterval(60 * 60 * 24 * 365) // Year ahead
        let selectedDate = Date() // Optional, can be nil
        let manager = ODCalendarManager(titleText: "appointment_request_date".localized,
                                        rightButtonText: "deselect_all".localized,
                                        doneButtonText: "done".localized,
                                        activeUIColor: CustomConfigAdapter.shared.color,
                                        disabledUIColor: .lightGray,
                                        minimumDate: minimumDate,
                                        maximumDate: maximumDate,
                                        disabledDates: disabledDates,
                                        selectedDate: selectedDate)
        let swiftUIView = ODCalendarView(manager: manager,
                                         dateSelected: { dateSelected in
            print(dateSelected ?? "")
            self.dismiss(animated: true)
        })
        let calendarViewController = UIHostingController(rootView: swiftUIView)
        self.present(calendarViewController, animated: true)
```