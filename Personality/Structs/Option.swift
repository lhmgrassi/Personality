//
//  Category.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

protocol OptionProtocol {
	
	var option			: String { get set }
}

struct Option: OptionProtocol {

	var option			: String

	init(withEntity entity: DBOptions) {
		self.option = entity.option ?? ""
	}
}
