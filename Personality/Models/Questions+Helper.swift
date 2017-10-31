//
//  Categories+Helper.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import CoreData

extension DBQuestions {

	func setProperties(dictionary: Dictionary<String, AnyObject>) {
		
		self.question = dictionary[Constants.Json.Keys.Questions.question] as? String
		
		guard let questionType = dictionary[Constants.Json.Keys.Questions.QuestionType.root] as? Dictionary<String, AnyObject> else {
			assertionFailure("No question type found")
			return
		}
		
		self.type = questionType[Constants.Json.Keys.Questions.QuestionType.type] as? String
		
		let categoryString = dictionary[Constants.Json.Keys.Questions.category] as? String ?? ""
		let predicate = NSPredicate(format: "category == %@", categoryString)
		
		guard let category = CoreDataHelper.shared.get(for: DBCategories.self, withPredicate: predicate) else {
			assertionFailure("It was not possible to find the category")
			return
		}
		
		self.category = category.first
		
		guard let options = questionType[Constants.Json.Keys.Questions.QuestionType.options] as? [String] else {
			assertionFailure("No options found")
			return
		}
		
		options.forEach { (option: String) in
			let entity = CoreDataHelper.shared.insertNewObject(entity: DBOptions.self)
			entity.option = option
			entity.question = self
		}
	}
}
