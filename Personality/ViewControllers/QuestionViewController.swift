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
	
	// MARK: - Private properties
	
	private var viewModel: QuestionViewModelProtocol!
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.viewModel == nil {
			self.viewModel = QuestionViewModel()
		}
		
		self.title = R.string.localizable.categoriesViewControllerTitle()
	}
}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}

}

