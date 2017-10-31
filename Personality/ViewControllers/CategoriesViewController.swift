//
//  CategoriesViewController
//  Personality
//
//  Created by Luis Henrique Grassi on 26/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import Rswift

class CategoriesViewController: UIViewController {
	
	@IBOutlet private weak var collectionView: UICollectionView!
	
	// MARK: - Private properties
	
	private var viewModel: CategoriesViewModelProtocol!
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = R.string.localizable.categoriesViewControllerTitle()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if self.viewModel == nil {
			self.viewModel = CategoriesViewModel()
		} else {
			self.viewModel.updateCategories()
		}
		
		self.collectionView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if 	segue.identifier == R.segue.categoriesViewController.goToQuestions.identifier,
			let questionNavigationViewController = segue.destination as? UINavigationController,
			let questionViewController = questionNavigationViewController.viewControllers.first as? QuestionViewController,
			let cell = sender as? UICollectionViewCell,
			let indexPath = self.collectionView.indexPath(for: cell) {
				let category = self.viewModel.categories[indexPath.row]
				let questionViewModel = QuestionViewModel(withQuestionIndex: self.viewModel.nextQuestionIndex, andCategory: category)
				questionViewController.viewModel = questionViewModel
		}
	}
}

// MARK: - CollectionView delegates

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.viewModel.categories.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.categoryCollectionViewCellIdentifier.identifier, for: indexPath) as? CategoryCollectionViewCell else {
			assertionFailure("It was not possible dequeue the cell")
			return UICollectionViewCell()
		}
		
		let category = self.viewModel.categories[indexPath.row]
		cell.setContent(with: category)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: UIScreen.main.bounds.width/2, height: Constants.Category.cellHeight)
	}
}

