//
//  CategoriesViewModel.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import CoreData

protocol CategoriesViewModelProtocol {
	
	var nextQuestionIndex : Int { get set }
	var categories: [CategoryProtocol] { get set }
}

class CategoriesViewModel : CategoriesViewModelProtocol {

	var nextQuestionIndex = 0
	var categories: [CategoryProtocol] = []
	
	init() {
		let dbCategories = CoreDataHelper.shared.getAllObjects(for: DBCategories.self)
	
		for (index, categoryModel) in (dbCategories?.enumerated())! {
			let category = Category.init(withEntity: categoryModel, forIndex: index)
			categories.append(category)
		}
	}
}
