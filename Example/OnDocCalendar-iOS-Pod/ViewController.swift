//
//  ViewController.swift
//  OnDocCalendar-iOS-Pod
//
//  Created by 3684453 on 08/20/2022.
//  Copyright (c) 2022 3684453. All rights reserved.
//

import UIKit
// Import SwiftUI for using UIHostingController
import SwiftUI

class ViewController: UIViewController {
    // Properties for manager
    let disabledDates = [Date().addingTimeInterval(86400 * 3),
                         Date().addingTimeInterval(86400 * 5),
                         Date().addingTimeInterval(86400 * 10)] // Not available dates - for example 3, 5, 10 days ahead
    let minimumDate = Date() // Minimum today
    let maximumDate = Date().addingTimeInterval(86400 * 365) // Year ahead
    let selectedDate = Date() // Optional, can be nil
    let uiColorSheme = UIColor.blue // App color
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Create manager
        let manager = ODCalendarManager(minimumDate: minimumDate,
                                        maximumDate: maximumDate,
                                        disabledDates: disabledDates,
                                        selectedDate: selectedDate,
                                        uiColorSheme: uiColorSheme)
        // Properties for View
        let titleText = "appointment_request_date"
        let rightButtonText = "deselect_all"
        let doneButtonText = "done"
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
        if #available(iOS 13.0, *) {
            let calendarViewController = UIHostingController(rootView: swiftUIView)
            self.present(calendarViewController, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

