//
//  JsonFile
//  Personality
//
//  Created by Luis Henrique Grassi on 26/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

struct JsonFile {
	
	func importJson(withFilename filename: String = Constants.Json.filename) {
		guard let path = Bundle.main.path(forResource: Constants.Json.filename, ofType: "json") else {
			assertionFailure("It was not possible to read the file \(Constants.Json.filename)")
			return
		}
		
		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
			let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
			
			guard let dataDictionary = jsonResult as? Dictionary<String, AnyObject> else {
				assertionFailure("It was not possible to read the file \(Constants.Json.filename)")
				return
			}
			
			guard let categories = dataDictionary[Constants.Json.Keys.Categories.root] as? [String] else {
				assertionFailure("No categories found")
				return
			}
			
			guard let questions = dataDictionary[Constants.Json.Keys.Questions.root] as? [Dictionary<String, AnyObject>] else {
				assertionFailure("No questions found")
				return
			}
			
			categories.forEach({ (category: String) in
				let entity = CoreDataHelper.shared.insertNewObject(entity: DBCategories.self)
				entity.category = category
			})
			
			for question in questions {
				let entity = CoreDataHelper.shared.insertNewObject(entity: DBQuestions.self)
				if !entity.setProperties(dictionary: question) {
					return
				}
			}
			
			if CoreDataHelper.shared.saveContext() {
				UserDefaults.standard.set(true, forKey: Constants.Sandbox.alreadyImportedJson)
			}
		} catch {
			assertionFailure("An error occurred processing the file \(Constants.Json.filename)")
		}
	}

}
