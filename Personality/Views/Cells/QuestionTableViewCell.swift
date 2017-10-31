//
//  QuestionTableViewCell
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
	
	@IBOutlet private weak var optionLabel: UILabel!
	
	func setContent(with item: OptionProtocol) {
		self.optionLabel.text = item.option
	}
}
