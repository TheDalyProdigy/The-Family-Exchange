//
//  CreateAFamilyView.swift
//  The Family Exchange
//
//  Created by Cole Daly on 12/26/18.
//  Copyright © 2018 Cole Daly. All rights reserved.
//

import UIKit
import MessageUI

class CreateAFamilyView: UIViewController, MFMessageComposeViewControllerDelegate {

    var window: UIWindow?
    
    var _familyNameTextField : UITextField? = nil
    var _familyName : UILabel? = nil
    var _saveFamilyName : UIButton? = nil
    var _cancelFamilyName : UIButton? = nil
    var _passcodeLabel : UILabel? = nil
    var _passcode : UILabel? = nil
    var _doneCreateAFamily : UIButton? = nil
    var _cancelCreateAFamily : UIButton? = nil
    var _shareImage : UIButton? = nil
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number1 = Int.random(in: 0 ..< 10)
        let number2 = Int.random(in: 0 ..< 10)
        let number3 = Int.random(in: 0 ..< 10)
        let number4 = Int.random(in: 0 ..< 10)
        let number5 = Int.random(in: 0 ..< 10)
        let number6 = Int.random(in: 0 ..< 10)
        
        let numberPasscodeString1 = String(number1)
        let numberPasscodeString2 = String(number2)
        let numberPasscodeString3 = String(number3)
        let numberPasscodeString4 = String(number4)
        let numberPasscodeString5 = String(number5)
        let numberPasscodeString6 = String(number6)
        
        let cancelCreateAFamily = UIButton()
        cancelCreateAFamily.frame = CGRect(x: 10, y: 50, width:60, height: 50)
        cancelCreateAFamily.setTitle("Cancel", for: .normal)
        cancelCreateAFamily.setTitleColor(UIColor.blue, for: .normal)
        cancelCreateAFamily.addTarget(self, action: #selector(cancelCreateAFamilyTapped), for: .touchUpInside)
        self.view.addSubview(cancelCreateAFamily)
        _cancelCreateAFamily = cancelCreateAFamily
        
        let DoneCreateAFamily = UIButton()
        DoneCreateAFamily.frame = CGRect(x: 350, y: 50, width: 50, height: 50)
        DoneCreateAFamily.setTitle("Done", for: .normal)
        DoneCreateAFamily.setTitleColor(UIColor.blue, for: .normal)
        DoneCreateAFamily.addTarget(self, action: #selector(doneCreateAFamilyTapped), for: .touchUpInside)
        self.view.addSubview(DoneCreateAFamily)
        _doneCreateAFamily = DoneCreateAFamily
        
        let familyNameLabel = UILabel(frame: CGRect(x: 0, y: 150, width: 150, height: 50))
        familyNameLabel.textAlignment = .center
        familyNameLabel.textColor = UIColor.black
        familyNameLabel.text = "Family Name : "
        self.view.addSubview(familyNameLabel)
        
        let passcodeLabel = UILabel(frame: CGRect(x: 14, y: 300, width: 150, height: 50))
        passcodeLabel.textAlignment = .center
        passcodeLabel.alpha = 0.0
        passcodeLabel.textColor = UIColor.black
        passcodeLabel.text = "Family Passcode : "
        self.view.addSubview(passcodeLabel)
        _passcodeLabel = passcodeLabel
        
        let passcode = UILabel(frame: CGRect(x: 130, y: 300, width: 150, height: 50))
        passcode.textAlignment = .center
        passcode.alpha = 0.0
        passcode.textColor = UIColor.black
        passcode.text = numberPasscodeString1 + numberPasscodeString2 + numberPasscodeString3 + numberPasscodeString4 + numberPasscodeString5 + numberPasscodeString6
        self.view.addSubview(passcode)
        _passcode = passcode

        let familyNameTxt =  UITextField(frame: CGRect(x: 130, y: 155, width: 230, height: 40))
        familyNameTxt.placeholder = "Ex: The Staff Christmas Party"
        familyNameTxt.alpha = 0.5
        familyNameTxt.font = UIFont.systemFont(ofSize: 15)
        familyNameTxt.borderStyle = UITextField.BorderStyle.roundedRect
        familyNameTxt.autocorrectionType = UITextAutocorrectionType.no
        familyNameTxt.keyboardType = UIKeyboardType.default
        familyNameTxt.returnKeyType = UIReturnKeyType.done
        familyNameTxt.clearButtonMode = UITextField.ViewMode.whileEditing
        familyNameTxt.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(familyNameTxt)
        _familyNameTextField = familyNameTxt
        
        let familyName = UILabel(frame: CGRect(x: 130, y: 155, width: 230, height: 40))
        familyName.textAlignment = .center
        familyName.textColor = UIColor.black
        familyName.text = familyNameTxt.text
        familyName.alpha = 1.0
        self.view.addSubview(familyName)
        _familyName = familyName
        
        let saveFamilyName = UIButton()
        saveFamilyName.frame = CGRect(x: 363, y: 150, width: 50, height: 50)
        saveFamilyName.backgroundColor = UIColor.blue
        saveFamilyName.layer.cornerRadius = 25.0
        saveFamilyName.setTitle("Save", for: .normal)
        saveFamilyName.addTarget(self, action: #selector(saveFamilyNameTapped), for: .touchUpInside)
        self.view.addSubview(saveFamilyName)
        _saveFamilyName = saveFamilyName
        
        let cancelFamilyName = UIButton()
        cancelFamilyName.frame = CGRect(x: 363, y: 150, width: 50, height: 50)
        cancelFamilyName.backgroundColor = UIColor.red
        cancelFamilyName.titleLabel?.font =  .systemFont(ofSize: 12)
        cancelFamilyName.layer.cornerRadius = 25.0
        cancelFamilyName.alpha = 0.0
        cancelFamilyName.setTitle("Cancel", for: .normal)
        cancelFamilyName.addTarget(self, action: #selector(cancelFamilyNameTapped), for: .touchUpInside)
        self.view.addSubview(cancelFamilyName)
        _cancelFamilyName = cancelFamilyName
        
//        let shareImage = UIImage(named: "ShareCodePic")
        let shareButton = UIButton(type: UIButton.ButtonType.custom)
        shareButton.frame = CGRect.init(x: 140, y: 475, width: 140, height: 50)
        shareButton.alpha = 0.0
        shareButton.layer.cornerRadius = 10.0
        shareButton.backgroundColor = UIColor.green
        shareButton.setTitle("Share code", for: .normal)
//        shareButton.setImage(shareImage, for: .normal)
        shareButton.addTarget(self, action: #selector(shareImageTapped), for: .touchUpInside)
        self.view.addSubview(shareButton)
        _shareImage = shareButton
    }
    
    @objc func saveFamilyNameTapped(sender: UIButton!) {
        _familyNameTextField?.alpha = 0.0
        _familyName?.text = _familyNameTextField?.text
        _familyName?.alpha = 1.0
        _saveFamilyName?.alpha = 0.0
        _cancelFamilyName?.alpha = 1.0
        _passcode?.alpha = 1.0
        _passcodeLabel?.alpha = 1.0
        _shareImage?.alpha = 1.0
        textFieldShouldReturn(textField: _familyNameTextField!)
        
        
    }
    
    @objc func cancelFamilyNameTapped(sender: UIButton!) {
        _cancelFamilyName?.alpha = 0.0
        _saveFamilyName?.alpha = 1.0
        _familyName?.alpha = 0.0
        _familyNameTextField?.alpha = 1.0

    }
    
    @objc func cancelCreateAFamilyTapped(sender: UIButton!) {
        let masterVC = MainMenuViewController()
        window = UIWindow()
        masterVC.view.backgroundColor = UIColor.white
        window?.rootViewController = masterVC
        window?.makeKeyAndVisible()
        
    }
    
    @objc func doneCreateAFamilyTapped(sender: UIButton!) {
        let masterVC = MainMenuViewController()
        window = UIWindow()
        masterVC.view.backgroundColor = UIColor.white
        window?.rootViewController = masterVC
        window?.makeKeyAndVisible()
    }
    
    @objc func shareImageTapped(sender: UIButton!) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
        
        // Configure the fields of the interface.
//        composeVC.recipients = ["13142026521"]
        composeVC.body = "The code to my group, \(_familyName!.text ?? "") is \(_passcode!.text ?? "")"
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        }
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        //or
        //self.view.endEditing(true)
        return true
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
        controller.dismiss(animated: true, completion: nil)}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
