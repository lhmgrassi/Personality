//
//  Constants.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 26/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

struct Constants {
	
	// MARK: - Json
	
	struct Json {
		
		static let filename = "personality_test"
		
		struct Keys {
		
			struct Categories {
				
				static let categories = "categories"
			}

			struct Questions {
				
				static let question = "question"
				static let question_type = "question_type"
			}

		}
	}
}
