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
				let entity = CoreDataHelper.shared.insertNewObject(entity: Categories.self)
				entity.category = category
			})
			
			questions.forEach({ (question: Dictionary<String, AnyObject>) in
				let entity = CoreDataHelper.shared.insertNewObject(entity: Questions.self)
				entity.setProperties(dictionary: question)
			})
			
			CoreDataHelper.shared.saveContext()
		} catch {
			assertionFailure("An error occurred processing the file \(Constants.Json.filename)")
		}
	}

}
