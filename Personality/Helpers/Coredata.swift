//
//  Coredata.swift
//  Personality
//
//  Created by Luis Henrique Grassi on 27/10/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit
import CoreData

class CoredataHelper: NSObject {

	static let shared = CoredataHelper()
	
	// MARK: - Private properties
	
	private let dataModelName = "Personality"
	
	private lazy var applicationDocumentsDirectory: URL = {
		let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		
		return urls[urls.count-1]
	}()
	
	private lazy var managedObjectModel: NSManagedObjectModel = {
		let modelURL = Bundle.main.url(forResource: self.dataModelName, withExtension: "momd")!
		
		return NSManagedObjectModel(contentsOf: modelURL)!
	}()
	
	private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
		let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
		let url = self.applicationDocumentsDirectory.appendingPathComponent("\(self.dataModelName).sqlite")
		
		do {
			try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
		} catch {
			assertionFailure("Unresolved error")
		}
		
		return coordinator
	}()
	
	// MARK: - Public properties
	
	lazy var context: NSManagedObjectContext = {
		var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
		managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
		
		return managedObjectContext
	}()

}

extension CoredataHelper {
	
	// MARK: - Helper function
	
	func saveContext() {
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				assertionFailure("Unresolved error")
			}
		}
	}
}
