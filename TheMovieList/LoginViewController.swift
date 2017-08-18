//
//  LoginViewController.swift
//  TheMovieList
//
//  Created by Tyler Perkins on 8/18/17.
//  Copyright © 2017 Tyler Perkins. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "SignUpSegue", sender: self)
        
    }
    
    func setupLoginButton () {
        
        loginButton.layer.cornerRadius = 10
        
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
