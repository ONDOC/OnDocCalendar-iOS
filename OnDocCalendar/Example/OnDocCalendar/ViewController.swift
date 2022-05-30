//
//  ViewController.swift
//  OnDocCalendar
//
//  Created by 3684453 on 05/30/2022.
//  Copyright (c) 2022 3684453. All rights reserved.
//

import UIKit
import OnDocCalendar
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Calendar
        let disabledDates = [Date().addingTimeInterval(60 * 60 * 24 * 3),
                             Date().addingTimeInterval(60 * 60 * 24 * 5),
                             Date().addingTimeInterval(60 * 60 * 24 * 10)] // Disabled 3, 5, 10 days ahead
        let minimumDate = Date() // Minimum today
        let maximumDate = Date().addingTimeInterval(60 * 60 * 24 * 365) // Year ahead
        let manager = ODCalendarManager(titleText: "appointment_survey_title".localized,
                                        rightButtonText: "deselect_all".localized,
                                        doneButtonText: "done".localized,
                                        brandingUIColor: UIColor.blue,
                                        minimumDate: minimumDate,
                                        maximumDate: maximumDate,
                                        disabledDates: disabledDates)
        let swiftUIView = ODCalendarView(manager: manager, dateSelected: { dateSelected in
            print(dateSelected ?? "")
            self.dismiss(animated: true)
        })
        let calendarViewController = UIHostingController(rootView: swiftUIView)
        self.present(calendarViewController, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

