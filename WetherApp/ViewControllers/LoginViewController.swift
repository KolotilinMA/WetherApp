//
//  LoginViewController.swift
//  WetherApp
//
//  Created by Михаил on 23/01/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView?
    
    @IBOutlet private weak var titleLabel: UILabel?
    
    @IBOutlet private weak var loginHintLabel: UILabel?
    @IBOutlet private weak var loginTextField: UITextField?
    
    @IBOutlet private weak var passHintLabel: UILabel?
    @IBOutlet private weak var passTextField: UITextField?
    
    @IBOutlet private weak var loginButton: UIButton?
    
    private let demoLogin = "123"
    private let demoPass = "456"
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.addNotifications()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addNotifications()
    }
    
    deinit {
        self.removeNotifications()
    }
    
    // MARK: - Notifications
    
    private func addNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    private func removeNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWasShown(notification: Notification){
        guard let userInfo = notification.userInfo as NSDictionary? else {
            return
        }
        
        guard let keyboardFrame = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.size.height
        let contentInsets = UIEdgeInsets(top: 0.0,
                                          left: 0.0,
                                          bottom: keyboardHeight,
                                          right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: - Lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel?.text = "Weather App"
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonAction(){
        print("loginButtonAction")
        
        guard let loginText = self.loginTextField?.text else {
            print("EmptyLoginText")
            return
        }
        guard let passText = self.passTextField?.text else {
            print("EmptyPassText")
            return
        }
        
        if self.demoLogin == loginText && self.demoPass == passText {
            print("Success")
        } else {
            print("Wrong login or pass")
            self.showErrorAlert()
        }
    }
    
    func showErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "Wrong login or pass", preferredStyle: .alert)
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) in print("alertCancelAction")
        }
        alertController.addAction(alertCancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func closeKeyboardAction(){
        print("closeKeyboardAction")
        self.view.endEditing(true)
    }
    
    
}
