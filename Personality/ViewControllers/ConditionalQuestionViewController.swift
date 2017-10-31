//
//  CoditionalQuestionViewController
//  Personality
//
//  Created by Luis Henrique Grassi on 26/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import Rswift

protocol ConditionalQuestionViewControllerDelegate: class {
	func didSelectConditionalAnswer()
}

class ConditionalQuestionViewController: UIViewController {
	
	// MARK: - Public properties
	
	weak var delegate: ConditionalQuestionViewControllerDelegate!
	
	// MARK: - IBAction
	
	@IBAction private func finishedTapped(_ sender: Any) {
		self.dismiss(animated: true, completion: {
			self.delegate.didSelectConditionalAnswer()
		})
	}
}

