//
//  Category.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

protocol CategoryProtocol {
	
	var category				: String { get set }
	var categoryColor			: UIColor { get set }
	var categoryImage			: UIImage? { get set }
	var questionsCount			: Int { get set }
	var questionsLabel			: String { get set }
	var questionsAnsweredLabel	: String { get set }
}

struct Category: CategoryProtocol {

	var category				: String
	var categoryColor			: UIColor
	var categoryImage			: UIImage?
	var questionsCount			: Int
	var questionsLabel			: String
	var questionsAnsweredLabel	: String
	
	init(withEntity entity: DBCategories, forIndex index: Int) {
		self.category = entity.category ?? ""
		
		self.categoryColor = Constants.Category.colors[index % Constants.Category.colors.count]
		self.categoryImage = Constants.Category.images[index % Constants.Category.images.count]
		self.questionsCount = entity.questions?.count ?? 0
		self.questionsLabel = R.string.localizable.categoriesViewControllerTotalQuestions(self.questionsCount)
		
		let answeredCount = entity.questions!.filter { (question) -> Bool in
			return (question as! DBQuestions).answer != nil
		}.count
		self.questionsAnsweredLabel = R.string.localizable.categoriesViewControllerTotalQuestionsAnswered(answeredCount)
	}
}
