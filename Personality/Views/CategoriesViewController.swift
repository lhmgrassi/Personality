//
//  CategoriesViewController
//  Personality
//
//  Created by Luis Henrique Grassi on 26/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

	// MARK: - Private properties
	
	private var viewModel: CategoriesViewModelProtocol!
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.viewModel == nil {
			self.viewModel = CategoriesViewModel()
		}
	}
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
	return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return UICollectionViewCell()
	}
	
	
}

