//
//  QuestionViewModel
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import CoreData

protocol QuestionViewModelProtocol {
	
	var hasNextQuestion			: Bool { get }
	var questionsCount			: Int { get set }
	var currentQuestionIndex	: Int { get set }
	var question				: QuestionProtocol? { get set }
	
	func updateEntity(forIndex index: Int)
}

struct QuestionViewModel : QuestionViewModelProtocol {

	// Mark: - Public properties
	
	var questionsCount			: Int
	var currentQuestionIndex 	: Int
	var question				: QuestionProtocol?
	var hasNextQuestion 		: Bool {
		return self.questionsCount > (currentQuestionIndex + 1)
	}
	
	// Mark: - Private properties
	
	private var dbQuestion		: DBQuestions!
	
	init?(withQuestionIndex index: Int, andCategory category: CategoryProtocol) {
		let predicate = NSPredicate(format: "category.category == %@", category.category)
		let dbQuestions = CoreDataHelper.shared.get(for: DBQuestions.self, withPredicate: predicate)
		
		self.questionsCount = category.questionsCount
		self.currentQuestionIndex = index
		
		guard
			let questions = dbQuestions,
			index < questions.count else {
				return nil
		}
		
		self.dbQuestion = questions[index]
		self.question = Question(withEntity: self.dbQuestion, withCategory: category)
	}
	
	func updateEntity(forIndex index: Int) {
		let option = self.question?.options[index]
		self.dbQuestion.answer = option?.option
		if !CoreDataHelper.shared.saveContext() {
			assertionFailure("It was not possible to save the object.")
		}
	}
}
