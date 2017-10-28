//
//  AppDelegate.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 26/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		let alreadyImportedJson = (UserDefaults.standard.object(forKey: Constants.Sandbox.alreadyImportedJson) as? Bool) ?? false
		if !alreadyImportedJson {
			let jsonFile = JsonFile()
			jsonFile.importJson()
		}
		
		return true
	}
}

