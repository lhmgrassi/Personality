//
//  CategoriesViewModel.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import CoreData

protocol CategoriesViewModelProtocol : class {
	var categories: [Category] { get set }
}

class CategoriesViewModel : CategoriesViewModelProtocol {

	var categories: [Category] = []
	
	init() {
		let categoriesModel = CoreDataHelper.shared.getAllObjects(for: Categories.self)
		categoriesModel?.forEach({ (category) in
			categories.append(Category.init(with: category))
		})
	}
}
