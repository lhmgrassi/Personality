//
//  Category.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

struct Category {

	var category: String?
	
	init(with entity: Categories) {
		self.category = entity.category
	}
}
