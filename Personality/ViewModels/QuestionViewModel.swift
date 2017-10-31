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
	
	var question: QuestionProtocol? { get set }
}

class QuestionViewModel : QuestionViewModelProtocol {

	var question: QuestionProtocol?
	
	init?(withQuestionIndex index: Int, andCategory category: CategoryProtocol) {
		let predicate = NSPredicate(format: "category.category == %@", category.category)
		let dbQuestions = CoreDataHelper.shared.get(for: DBQuestions.self, withPredicate: predicate)
		
		guard
			let questions = dbQuestions,
			index < questions.count else {
				return nil
		}
		
		self.question = Question(withEntity: questions[index], withCategory: category)
	}
}
