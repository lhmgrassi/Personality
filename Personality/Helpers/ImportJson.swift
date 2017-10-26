//
//  ImportJson
//  Personality
//
//  Created by Luis Henrique Grassi on 26/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

struct ImportJson {
	
	func importJson() {
		guard let path = Bundle.main.path(forResource: Constants.Json.filename, ofType: "json") else {
			assertionFailure("It was not possible to read the file \(Constants.Json.filename)")
			return
		}
		
		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
			let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
			
			guard let dictionary = jsonResult as? Dictionary<String, AnyObject> else {
				assertionFailure("It was not possible to read the file \(Constants.Json.filename)")
				return
			}
			
			guard let categories = dictionary[Constants.Json.Keys.Categories.categories] as? [String] else {
				assertionFailure("No categories found")
				return
			}
			
		} catch {
			assertionFailure("An error occurred processing the file \(Constants.Json.filename)")
		}
	}

}
