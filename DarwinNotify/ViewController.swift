//
//  ViewController.swift
//  DarwinNotify
//
//  Created by Kaplan Deniz on 02/12/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit
import DarwinNotifyCenter

class ViewController: UIViewController {

	let notificationCenter = DarwinNotificationCenter.shared
	let userDefaults = UserDefaults(suiteName: "group.com.dkaplan.darwinNotify")!

	@IBOutlet weak var label: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		notificationCenter.addObserver(self, for: DarwinNotification.Name("dkaplan.test.notification")) {[weak self] _ in
			guard let self = self,
				let text = self.userDefaults.string(forKey: "label")
				else { return }
			DispatchQueue.main.async {
				self.label.text = text
			}
		}
	}
}

