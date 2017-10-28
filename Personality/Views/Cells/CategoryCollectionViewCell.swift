//
//  CategoryCollectionViewCell.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet private weak var categoryLabel		: UILabel!
	@IBOutlet private weak var categoryImageView	: UIImageView!
	
	func setContent(category: CategoryProtocol) {
		self.categoryLabel.text = category.category
		self.categoryLabel.textColor = category.categoryColor
		self.categoryImageView.image = category.categoryImage
	}
}
