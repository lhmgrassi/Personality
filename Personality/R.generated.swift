//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `personality_test.json`.
    static let personality_testJson = Rswift.FileResource(bundle: R.hostingBundle, name: "personality_test", pathExtension: "json")
    
    /// `bundle.url(forResource: "personality_test", withExtension: "json")`
    static func personality_testJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.personality_testJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 6 images.
  struct image {
    /// Image `category1`.
    static let category1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "category1")
    /// Image `category2`.
    static let category2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "category2")
    /// Image `category3`.
    static let category3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "category3")
    /// Image `category4`.
    static let category4 = Rswift.ImageResource(bundle: R.hostingBundle, name: "category4")
    /// Image `icon_list`.
    static let icon_list = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon_list")
    /// Image `icon_splash`.
    static let icon_splash = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon_splash")
    
    /// `UIImage(named: "category1", bundle: ..., traitCollection: ...)`
    static func category1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.category1, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "category2", bundle: ..., traitCollection: ...)`
    static func category2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.category2, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "category3", bundle: ..., traitCollection: ...)`
    static func category3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.category3, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "category4", bundle: ..., traitCollection: ...)`
    static func category4(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.category4, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon_list", bundle: ..., traitCollection: ...)`
    static func icon_list(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon_list, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon_splash", bundle: ..., traitCollection: ...)`
    static func icon_splash(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon_splash, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `CategoryCollectionViewCellIdentifier`.
    static let categoryCollectionViewCellIdentifier: Rswift.ReuseIdentifier<CategoryCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "CategoryCollectionViewCellIdentifier")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `Questions`.
    static let questions = _R.storyboard.questions()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    /// `UIStoryboard(name: "Questions", bundle: ...)`
    static func questions(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.questions)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 3 localization keys.
    struct localizable {
      /// en translation: %d answered
      /// 
      /// Locales: en
      static let categoriesViewControllerTotalQuestionsAnswered = Rswift.StringResource(key: "categoriesViewController.totalQuestionsAnswered", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: %d questions
      /// 
      /// Locales: en
      static let categoriesViewControllerTotalQuestions = Rswift.StringResource(key: "categoriesViewController.totalQuestions", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Categories
      /// 
      /// Locales: en
      static let categoriesViewControllerTitle = Rswift.StringResource(key: "categoriesViewController.title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      
      /// en translation: %d answered
      /// 
      /// Locales: en
      static func categoriesViewControllerTotalQuestionsAnswered(_ value1: Int) -> String {
        return String(format: NSLocalizedString("categoriesViewController.totalQuestionsAnswered", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: %d questions
      /// 
      /// Locales: en
      static func categoriesViewControllerTotalQuestions(_ value1: Int) -> String {
        return String(format: NSLocalizedString("categoriesViewController.totalQuestions", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: Categories
      /// 
      /// Locales: en
      static func categoriesViewControllerTitle(_: Void = ()) -> String {
        return NSLocalizedString("categoriesViewController.title", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try questions.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "icon_splash") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon_splash' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if UIKit.UIImage(named: "category1") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'category1' is used in storyboard 'Main', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct questions: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Questions"
      
      static func validate() throws {
        if UIKit.UIImage(named: "icon_list") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon_list' is used in storyboard 'Questions', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
