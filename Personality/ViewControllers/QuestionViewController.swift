//
//  CategoriesViewController
//  Personality
//
//  Created by Luis Henrique Grassi on 26/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import Rswift

class QuestionViewController: UIViewController {
	
	@IBOutlet private weak var questionLabel: UILabel!
	@IBOutlet private weak var tableView: UITableView!
	
	// MARK: - Public properties

	var viewModel: QuestionViewModelProtocol!
	
	var questionIndex: Int = 0
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = self.viewModel.question?.category.category
		self.questionLabel.text = self.viewModel.question?.question
	}
	
	// MARK: - IBAction
	
	@IBAction private func finishedTapped(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
}

// MARK: - TableView delegates

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewModel.question?.options.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.questionTableViewCell, for: indexPath) else {
			assertionFailure("It was not possible to dequeue the cell.")
			return UITableViewCell()
		}

		guard let option = self.viewModel.question?.options[indexPath.row] else {
			assertionFailure("Option can not be nil.")
			return UITableViewCell()
		}

		cell.setContent(with: option)
		
		return cell
	}

}

