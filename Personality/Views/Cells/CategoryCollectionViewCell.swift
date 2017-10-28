//
//  CategoryCollectionViewCell.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet private weak var categoryLabel: UILabel!
	
	func setContent(category: Category) {
		categoryLabel.text = category.category
	}
}
