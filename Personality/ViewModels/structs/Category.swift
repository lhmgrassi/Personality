//
//  Category.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

protocol CategoryProtocol {
	
	var category			: String { get set }
	var categoryColor		: UIColor { get set }
	var categoryImage		: UIImage? { get set }
	var questions			: String { get set }
	var questionsAnswered	: String { get set }
}

struct Category: CategoryProtocol {

	var category			: String
	var categoryColor		: UIColor
	var categoryImage		: UIImage?
	var questions			: String
	var questionsAnswered	: String
	
	init(withEntity entity: Categories, forIndex index: Int) {
		self.category = entity.category ?? ""
		
		self.categoryColor = Constants.Category.colors[index % Constants.Category.colors.count]
		self.categoryImage = Constants.Category.images[index % Constants.Category.images.count]
		self.questions = R.string.localizable.categoriesViewControllerTotalQuestions(entity.questions?.count ?? 0)
		
		let answeredCount = entity.questions!.filter { (question) -> Bool in
			return (question as! Questions).answer != nil
		}.count
		self.questionsAnswered = R.string.localizable.categoriesViewControllerTotalQuestionsAnswered(answeredCount)
	}
}
