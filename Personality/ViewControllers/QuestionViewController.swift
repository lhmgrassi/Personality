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
	
	@IBOutlet private weak var questionIndexLabel			: UILabel!
	@IBOutlet private weak var questionLabel				: UILabel!
	@IBOutlet private weak var tableView					: UITableView!
	@IBOutlet private weak var nextQuestionButton			: UIButton!
	@IBOutlet private weak var nextQuestionImageView		: UIImageView!
	@IBOutlet private weak var skipThisQuestionButton		: UIButton!
	@IBOutlet private weak var finishBarButtonItem			: UIBarButtonItem!
	
	// MARK: - Public properties

	var viewModel: QuestionViewModelProtocol!
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		
		self.title = self.viewModel.question?.category.category
		self.finishBarButtonItem.title = R.string.localizable.finish()
		self.skipThisQuestionButton.setTitle(R.string.localizable.questionViewControllerSkipThisQuestion(), for: .normal)
		self.questionLabel.text = self.viewModel.question?.question
		self.questionIndexLabel.text = "\(self.viewModel.currentQuestionIndex + 1)/\(self.viewModel.questionsCount)"
	}
	
	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		if identifier == R.segue.questionViewController.goToNextQuestion.identifier || identifier == R.segue.questionViewController.skipCurrentQuestion.identifier {
			if !self.viewModel.hasNextQuestion {
				self.dismissViewController()
				return false
			}
		}
		
		return true
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == R.segue.questionViewController.goToNextQuestion.identifier || segue.identifier == R.segue.questionViewController.skipCurrentQuestion.identifier {
			let nextQuestionViewController = segue.destination as! QuestionViewController
			let nextQuestionViewModel = QuestionViewModel(withQuestionIndex: self.viewModel.currentQuestionIndex + 1, andCategory: self.viewModel.question!.category)
			nextQuestionViewController.viewModel = nextQuestionViewModel
		}
	}
	
	private func dismissViewController() {
		self.dismiss(animated: true, completion: nil)
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
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.nextQuestionButton.isUserInteractionEnabled = true
		self.nextQuestionImageView.image = R.image.ic_ios_blue()
	}
}

