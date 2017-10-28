//
//  CategoryCollectionViewCell.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet private weak var categoryImageView		: UIImageView!
	@IBOutlet private weak var categoryLabel			: UILabel!
	@IBOutlet private weak var questionsLabel			: UILabel!
	@IBOutlet private weak var questionsAnsweredLabel	: UILabel!
	
	func setContent(category: CategoryProtocol) {
		self.categoryImageView.image = category.categoryImage
		self.categoryLabel.text = category.category
		self.categoryLabel.textColor = category.categoryColor
		self.questionsLabel.text = category.questions
		self.questionsLabel.textColor = category.categoryColor
		self.questionsAnsweredLabel.text = category.questionsAnswered
		self.questionsAnsweredLabel.textColor = category.categoryColor
	}
}
