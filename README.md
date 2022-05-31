# OnDocCalendar
Calendar Integration Example

Connect repository via Swift Package Manager, then import module
```swift
import OnDocCalendar
```
Declare properties
```swift
// Properties for manager
let disabledDates = [Date().addingTimeInterval(86400 * 3),
                     Date().addingTimeInterval(86400 * 5),
                     Date().addingTimeInterval(86400 * 10)] // Not available dates - for example 3, 5, 10 days ahead
let minimumDate = Date() // Minimum today
let maximumDate = Date().addingTimeInterval(86400 * 365) // Year ahead
let selectedDate = Date() // Optional, can be nil
let uiColorSheme = UIColor.blue // App color
// Create manager
let manager = ODCalendarManager(minimumDate: minimumDate,
                                maximumDate: maximumDate,
                                disabledDates: disabledDates,
                                selectedDate: selectedDate,
                                uiColorSheme: uiColorSheme)
// Properties for View
let titleText = "appointment_request_date".localized
let rightButtonText = "deselect_all".localized
let doneButtonText = "done".localized
```
For integration in UIKit project
```swift
// Import SwiftUI for using UIHostingController
import SwiftUI
// Create SwiftUI View
let swiftUIView = ODCalendarView(titleText: titleText,
                                 rightButtonText: rightButtonText,
                                 doneButtonText: doneButtonText,
                                 manager: manager,
                                 dateSelected: { dateSelected in
        self.dismiss(animated: true)
        if let dateSelected = dateSelected {
           print(dateSelected)
        }
        else {
           print("No selected date")
        }
})
// Create UIViewController
let calendarViewController = UIHostingController(rootView: swiftUIView)
self.present(calendarViewController, animated: true)
```
