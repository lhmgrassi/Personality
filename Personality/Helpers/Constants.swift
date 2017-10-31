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
	
	struct Colors {
		static let main  	= #colorLiteral(red: 0.3019607843, green: 0.4823529412, blue: 0.8509803922, alpha: 1)
		static let label  	= #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
	}
	
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
	
	struct Category {
		
		static let cellHeight : CGFloat = 205
		
		static let images = [#imageLiteral(resourceName: "category4"), #imageLiteral(resourceName: "category1"), #imageLiteral(resourceName: "category2"), #imageLiteral(resourceName: "category3")]
		static let colors = [#colorLiteral(red: 1, green: 0.6156862745, blue: 0.2666666667, alpha: 1), #colorLiteral(red: 0.05882352941, green: 0.2784313725, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 1, green: 0.9490196078, blue: 0.3058823529, alpha: 1)]
	}
	
	struct Question {
		
		static let questionViewCornerRadius 	: CGFloat = 5
		static let questionViewShadowOpacity 	: Float = 10
		static let questionViewShadowRadius 	: CGFloat = 3
	}
	
	struct Sandbox {
		static let alreadyImportedJson	= "alreadyImportedJson"
	}
}
