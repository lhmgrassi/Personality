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
	
	func setContent(with item: CategoryProtocol) {
		self.categoryImageView.image = item.categoryImage
		
		self.categoryLabel.text = item.category
		self.categoryLabel.textColor = item.categoryColor
		
		self.questionsLabel.text = item.questionsLabel
		self.questionsLabel.textColor = item.categoryColor
		
		self.questionsAnsweredLabel.text = item.questionsAnsweredLabel
		self.questionsAnsweredLabel.textColor = item.categoryColor
	}
}
