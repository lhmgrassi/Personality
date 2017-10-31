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
	
	var nextQuestionIndex 	: Int { get set }
	var categories			: [CategoryProtocol] { get set }
	mutating func updateCategories()
}

struct CategoriesViewModel : CategoriesViewModelProtocol {

	// Mark: - Public properties
	
	var nextQuestionIndex = 0
	var categories: [CategoryProtocol] = []
	
	init() {
		self.updateCategories()
	}
	
	mutating func updateCategories() {
		let dbCategories = CoreDataHelper.shared.getAllObjects(for: DBCategories.self)
		
		self.categories.removeAll()
		for (index, categoryModel) in (dbCategories?.enumerated())! {
			let category = Category.init(withEntity: categoryModel, forIndex: index)
			self.categories.append(category)
		}
	}
}
