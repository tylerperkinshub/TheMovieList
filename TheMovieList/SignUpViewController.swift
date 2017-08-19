//
//  SignUpViewController.swift
//  TheMovieList
//
//  Created by Tyler Perkins on 8/18/17.
//  Copyright © 2017 Tyler Perkins. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    var activityIndicator  = UIActivityIndicatorView()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var createAccount: UIButton!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        createAccountButtonStyleSetup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        if usernameTextField.text == "" || passwordTextField.text == "" || passwordConfirmationTextField.text == "" || emailTextField.text == "" {
            
            createAlert(title: "All fields required", message: "Username, password and email are required for singup")
            
        } else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            let user = PFUser()
            if comparePassword(password: passwordTextField.text!, passwordConfirmation: passwordConfirmationTextField.text!) {
                user.username = usernameTextField.text
                user.password = passwordTextField.text
                user.email = emailTextField.text
                
                user.signUpInBackground(block: { (success, error) in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if error != nil {
                        var displayErrorMessage = "Please try again later."
                        let error = error as NSError?
                        if let errorMessage = error?.userInfo["error"] as? String {
                            displayErrorMessage = errorMessage
                            
                        }
                        
                        self.createAlert(title: "Signup Error", message: displayErrorMessage)

                    } else {
                        
                        print("User signed up")
                            self.alertWithSegueToRootNavigationController(title: "Signed up", message: "Sign in now")
                    }
                })
            } else {
                activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                createAlert(title: "Password Error", message: "Passwords do not match")
            }
        }
        
    }

    
    func createAccountButtonStyleSetup () {
        
        createAccount.layer.cornerRadius = 10
        
    }
    
    func createAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func alertWithSegueToRootNavigationController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)

        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func comparePassword(password: String, passwordConfirmation: String) -> Bool {
        
        if passwordTextField.text != "" && passwordConfirmationTextField.text != "" {
            if passwordTextField.text == passwordConfirmationTextField.text {
             return true
            }
        }
        return false
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
