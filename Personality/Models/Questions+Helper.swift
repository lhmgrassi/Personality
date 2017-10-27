//
//  Categories+Helper.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import CoreData

extension Questions {

	func setProperties(dictionary: Dictionary<String, AnyObject>) {
		
		self.question = dictionary[Constants.Json.Keys.Questions.question] as? String
		
		guard let questionType = dictionary[Constants.Json.Keys.Questions.QuestionType.root] as? Dictionary<String, AnyObject> else {
			assertionFailure("No question type found")
			return
		}
		
		self.type = questionType[Constants.Json.Keys.Questions.QuestionType.type] as? String
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: NSStringFromClass(Categories.self))
		fetchRequest.predicate = NSPredicate(format: "category == %@", "hard_fact")
		
		guard let category = try? CoreDataHelper.shared.context.fetch(fetchRequest) as? [Categories] else {
			assertionFailure("It was not possible to find the category")
			return
		}
		
		self.category = category?.first
		
		guard let options = questionType[Constants.Json.Keys.Questions.QuestionType.options] as? [String] else {
			assertionFailure("No options found")
			return
		}
		
		options.forEach { (option: String) in
			let entity = CoreDataHelper.shared.insertNewObject(entity: Options.self)
			entity.option = option
			entity.question = self
		}
	}
}
