//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Mayur Parmar on 24/06/20.
//  Copyright © 2020 Mayur Parmar. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
  //connect to label
  @IBOutlet var textLabel: NSTextField!
  let quotes = Quote.all
  
  var currentQuoteIndex: Int = 0 {
    didSet {
      updateQuote()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentQuoteIndex = 0
  }
  
  func updateQuote() {
    textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
  }
}

extension QuotesViewController {
  @IBAction func previous(_ sender: NSButton) {
    currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
  }
  
  @IBAction func next(_ sender: NSButton) {
    currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
  }
  
  @IBAction func quit(sender: NSButton) {
    NSApplication.shared.terminate(sender)
  }
}

extension QuotesViewController {
  // MARK: Storyboard instantiation
  static func freshController() -> QuotesViewController {
    let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
    let identifier = NSStoryboard.SceneIdentifier(rawValue: "QuotesViewController")
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
      fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
    }
    return viewcontroller
  }
}
