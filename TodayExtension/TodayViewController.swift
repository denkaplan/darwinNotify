//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Kaplan Deniz on 02/12/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit
import NotificationCenter
import DarwinNotifyCenter

class TodayViewController: UIViewController, NCWidgetProviding {

	let notificationCenter = DarwinNotificationCenter.shared
	let userDefaults = UserDefaults(suiteName: "group.com.dkaplan.darwinNotify")!
        
    override func viewDidLoad() {
        super.viewDidLoad()

		if let randomLabel = labels.randomElement() {
			userDefaults.set(randomLabel, forKey: "label")
			notificationCenter.postNotification(DarwinNotification.Name("dkaplan.test.notification"))
		}
        // Do any additional setup after loading the view.
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }

	let labels = ["Apple", "Orange", "Kiwi", "Banana"]
}
