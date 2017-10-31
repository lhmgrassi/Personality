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
		
		assert(self.viewModel != nil, "ViewModel should not be nil")
		
		self.title = self.viewModel.question?.category.category
		self.finishBarButtonItem.title = R.string.localizable.finish()
		self.skipThisQuestionButton.setTitle(R.string.localizable.questionViewControllerSkipThisQuestion(), for: .normal)
		self.questionLabel.text = self.viewModel.question?.question
		self.questionIndexLabel.text = "\(self.viewModel.currentQuestionIndex + 1)/\(self.viewModel.questionsCount)"
	}
	
	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		if 	identifier == R.segue.questionViewController.goToNextQuestion.identifier,
			let row = self.tableView.indexPathForSelectedRow?.row {
				self.viewModel.updateEntity(forIndex: row)
			
				if 	let conditionalAnswer = self.viewModel.question?.conditionalAnswer,
					let answer = self.viewModel.question?.answer,
					conditionalAnswer == answer {
						self.performSegue(withIdentifier: R.segue.questionViewController.goToConditionalQuestionViewController.identifier, sender: nil)
						return false
				}
		}
		
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
	
	private func didSelectAnswer() {
		self.nextQuestionButton.isUserInteractionEnabled = true
		self.nextQuestionImageView.image = R.image.ic_ios_blue()
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
		
		guard let question = self.viewModel.question else {
			assertionFailure("Question can not be nil.")
			return UITableViewCell()
		}
		
		let option = question.options[indexPath.row]
		
		cell.setContent(with: option)
		
		if option.option == question.answer {
			self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
			self.didSelectAnswer()
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.didSelectAnswer()
	}
}

extension QuestionViewController: ConditionalQuestionViewControllerDelegate {
	
	func didSelectConditionalAnswer() {
		DispatchQueue.main.async {
			self.performSegue(withIdentifier: R.segue.questionViewController.goToNextQuestion, sender: nil)
		}
	}
}
