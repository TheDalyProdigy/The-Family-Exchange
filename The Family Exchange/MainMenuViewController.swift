//
//  ViewController.swift
//  The Family Exchange
//
//  Created by Cole Daly on 12/26/18.
//  Copyright © 2018 Cole Daly. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
     var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let FamilyExchangeTitle = UILabel(frame: CGRect(x: 0, y: 50, width: 414, height: 50))
        FamilyExchangeTitle.textAlignment = .center
        FamilyExchangeTitle.textColor = UIColor.white
        FamilyExchangeTitle.layer.cornerRadius = 10.0
        FamilyExchangeTitle.backgroundColor = UIColor.blue
        FamilyExchangeTitle.text = "The Family Exchange"
        self.view.addSubview(FamilyExchangeTitle)
        
        let joinAFamilyButton = UIButton()
        joinAFamilyButton.frame = CGRect(x: 140, y: 200, width: 140, height: 50)
        joinAFamilyButton.backgroundColor = UIColor.red
        joinAFamilyButton.layer.cornerRadius = 10.0
        joinAFamilyButton.setTitle("Join a Family", for: .normal)
        joinAFamilyButton.addTarget(self, action: #selector(joinAFamilyButtonTapped), for: .touchUpInside)
        self.view.addSubview(joinAFamilyButton)
        
        let createAFamilyButton = UIButton()
        createAFamilyButton.frame = CGRect(x: 140, y: 450, width: 140, height: 50)
        createAFamilyButton.backgroundColor = UIColor.red
        createAFamilyButton.layer.cornerRadius = 10.0
        createAFamilyButton.setTitle("Create a Family", for: .normal)
        createAFamilyButton.addTarget(self, action: #selector(createAFamilyButtonTapped), for: .touchUpInside)
        self.view.addSubview(createAFamilyButton)
        
    }

    @objc func joinAFamilyButtonTapped(sender: UIButton!) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Join a family", message: "type in code", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Ex: 836490"

            textField.alpha = 0.5
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(String(describing: textField.text))")
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func createAFamilyButtonTapped(sender: UIButton!) {
        let masterVC = CreateAFamilyView()
        window = UIWindow()
        masterVC.view.backgroundColor = UIColor.white
        window?.rootViewController = masterVC
        window?.makeKeyAndVisible()
    }

}

