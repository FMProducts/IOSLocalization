//
//  ViewController.swift
//  IOSLocalization
//
//  Created by ideal on 1/26/20.
//  Copyright © 2020 fmproduct.ios.localization. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LanguageButton: UIButton!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Text: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LanguageButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(languageSelect(_:))))
        
        if languageSeted() {
            UserDefaults.standard.set("lang", forKey: "en")
        }
        localized()
    }
    
    func localized(){
        LanguageButton.setTitle("select_language".localized(), for: .normal)
        TitleLabel.text = "title".localized()
        Text.text = "text".localized()
    }

    func languageSeted() -> Bool{
        let lang = UserDefaults.standard.string(forKey: "lang")
        return lang != nil
    }
    
    @objc func languageSelect(_ sender : UITapGestureRecognizer){
        let alert = UIAlertController(title: "select_language".localized(), message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Русский", style: .default, handler: { (action) in
            UserDefaults.standard.set("ru", forKey: "lang")
            self.localized()
        }))
        alert.addAction(UIAlertAction(title: "English", style: .default, handler: { (action) in
            UserDefaults.standard.set("en", forKey: "lang")
            self.localized()
        }))
        
        alert.addAction(UIAlertAction(title: "Française", style: .default, handler: { (action) in
            UserDefaults.standard.set("fr", forKey: "lang")
            self.localized()
        }))
        
        alert.addAction(UIAlertAction(title: "cancel".localized(), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension String{
    func localized(bundle: Bundle = .main, tableName: String = "en") -> String {
        let table = UserDefaults.standard.string(forKey: "lang") ?? "en"
        
        return NSLocalizedString(self, tableName: (table+"Strings"), value: "**\(self)**", comment: "")
    }
}

