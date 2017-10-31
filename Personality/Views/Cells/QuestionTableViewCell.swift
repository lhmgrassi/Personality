//
//  QuestionTableViewCell
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
	
	@IBOutlet private weak var optionLabel				: UILabel!
	@IBOutlet private weak var questionContainerView	: UIView! {
		didSet {
			self.questionContainerView.layer.cornerRadius = Constants.Question.questionViewCornerRadius
			self.questionContainerView.layer.shadowColor = UIColor.gray.cgColor
			self.questionContainerView.layer.shadowOpacity = Constants.Question.questionViewShadowOpacity
			self.questionContainerView.layer.shadowOffset = CGSize(width: 0, height: Constants.Question.questionViewShadowRadius)
			self.questionContainerView.layer.shadowRadius = Constants.Question.questionViewShadowRadius
			self.questionContainerView.layer.shouldRasterize = true
		}
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		if selected {
			self.questionContainerView.layer.shadowOpacity = 0
			self.questionContainerView.backgroundColor = Constants.Colors.main
			self.optionLabel.textColor = .white
		} else {
			self.questionContainerView.layer.shadowOpacity = Constants.Question.questionViewShadowOpacity
			self.questionContainerView.backgroundColor = .white
			self.optionLabel.textColor = Constants.Colors.label
		}
	}
	
	func setContent(with item: OptionProtocol) {
		self.optionLabel.text = item.option
	}
}
