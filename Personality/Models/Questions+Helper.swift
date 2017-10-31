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

	func setProperties(dictionary: Dictionary<String, AnyObject>) -> Bool {
		
		self.question = dictionary[Constants.Json.Keys.Questions.question] as? String
		
		guard let questionType = dictionary[Constants.Json.Keys.Questions.QuestionType.root] as? Dictionary<String, AnyObject> else {
			assertionFailure("No question type found")
			return false
		}
		
		let categoryString = dictionary[Constants.Json.Keys.Questions.category] as? String ?? ""
		let predicate = NSPredicate(format: "category == %@", categoryString)
		
		guard let category = CoreDataHelper.shared.get(for: DBCategories.self, withPredicate: predicate) else {
			assertionFailure("It was not possible to find the category")
			return false
		}
		
		self.category = category.first
		
		self.type = questionType[Constants.Json.Keys.Questions.QuestionType.type] as? String
		
		guard let enumType = Constants.Json.QuestionTypes(rawValue: self.type ?? "") else {
			assertionFailure("Unsupported type")
			return false
		}
		
		if enumType == .numberRange {
			guard let range = questionType[Constants.Json.Keys.Questions.QuestionType.range] as? Dictionary<String, Int> else {
				assertionFailure("Range not found")
				return false
			}
			
			self.maxRange = Int32(range[Constants.Json.Keys.Questions.QuestionType.maxRange] ?? 0)
			self.minRange = Int32(range[Constants.Json.Keys.Questions.QuestionType.minRange] ?? 0)
		} else {
			guard let options = questionType[Constants.Json.Keys.Questions.QuestionType.options] as? [String] else {
				assertionFailure("No options found")
				return false
			}
			
			options.forEach { (option: String) in
				let entity = CoreDataHelper.shared.insertNewObject(entity: DBOptions.self)
				entity.option = option
				entity.question = self
			}
			
//			if enumType == .singleChoiceConditional {
//				guard
//					let condition = questionType[Constants.Json.Keys.Questions.QuestionType.condition] as? Dictionary<String, AnyObject>,
//					let predicate = condition[Constants.Json.Keys.Questions.QuestionType.predicate] as? Dictionary<String, AnyObject>,
//					let exactEquals = predicate[Constants.Json.Keys.Questions.QuestionType.exactEquals] as? [String],
//					let childQuestion = condition[Constants.Json.Keys.Questions.QuestionType.selectionCondition] as? Dictionary<String, AnyObject> else {
//						assertionFailure("Invalid conditional question")
//						return false
//				}
//				
//				self.conditionalAnswer = exactEquals[1]
//				
//				let childEntity = CoreDataHelper.shared.insertNewObject(entity: DBQuestions.self)
//				if !childEntity.setProperties(dictionary: childQuestion) {
//					return false
//				}
//				childEntity.parent = self
//			}
		}
		
		return true
	}
}
