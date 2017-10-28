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
	
	var categories: [CategoryProtocol] { get set }
}

class CategoriesViewModel : CategoriesViewModelProtocol {

	var categories: [CategoryProtocol] = []
	
	init() {
		let categoriesModel = CoreDataHelper.shared.getAllObjects(for: Categories.self)
		for (index, categoryModel) in (categoriesModel?.enumerated())! {
			let category = Category.init(withEntity: categoryModel, forIndex: index)
			categories.append(category)
		}
	}
}
