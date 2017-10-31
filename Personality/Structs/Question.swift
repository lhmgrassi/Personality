//
//  Category.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

protocol QuestionProtocol {
	
	var question			: String { get set }
	var conditionalAnswer	: String? { get set }
	var answer				: String? { get set }
	var category			: CategoryProtocol { get set }
	var options				: [OptionProtocol] { get set }
}

struct Question: QuestionProtocol {

	var question			: String
	var conditionalAnswer	: String?
	var answer				: String?
	var category			: CategoryProtocol
	var options				: [OptionProtocol]

	init(withEntity entity: DBQuestions, withCategory category: CategoryProtocol) {
		self.question = entity.question ?? ""
		self.category = category
		self.answer = entity.answer
		self.conditionalAnswer = entity.conditionalAnswer
		
		self.options = []
		entity.options?.forEach({ (entity) in
			let option = Option(withEntity: entity as! DBOptions)
			self.options.append(option)
		})
	}
}
