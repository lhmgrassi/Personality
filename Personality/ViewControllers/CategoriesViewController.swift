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
		
		if self.viewModel == nil {
			self.viewModel = CategoriesViewModel()
		}
		
		self.title = R.string.localizable.categoriesViewControllerTitle()
	}
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.viewModel.categories.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.categoryCollectionViewCellIdentifier.identifier, for: indexPath)
		
		return cell
	}
	
	
}

