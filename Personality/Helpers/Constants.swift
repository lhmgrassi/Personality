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
				
				static let root = "categories"
			}

			struct Questions {
				
				static let root 			= "questions"
				static let question 		= "question"
				static let category 		= "category"
				
				struct QuestionType {
				
					static let root 		= "question_type"
					static let type 		= "type"
					static let options 		= "options"
				}
			}
		}
	}
	
	enum QuestionType: String {
		
		case singleChoice 				= "single_choice"
		case singleChoiceConditional 	= "single_choice_conditional"
		case numberRange 				= "number_range"
	}
}
