//
//  AuthViewController.swift
//  IGid
//
//  Created by Магомедов Рамазан on 01.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit
import GoogleSignIn

final class AuthViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private let logoLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView()
    
    private let getStartedLabel = UILabel(text: "Начните с помощью", font: Font.sfuiDisplayRegular(size: 14))
    
    private let registrationLabel = UILabel(text: "Или зарегистрируйтесь с", font: Font.sfuiDisplayRegular(size: 14))
    
    private let loginLabel = UILabel(text: "Уже зарегистрированы?", font: Font.sfuiDisplayRegular(size: 14))
    
    private let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: UIColor.white, font: Font.sfuiDisplayRegular(size: 16), isShadow: true, cornerRadius: 8, image: Images.googleLogo()!)
    
    private let appleButton = UIButton(title: "Apple ID", titleColor: .black, backgroundColor: UIColor.white, font: Font.sfuiDisplayRegular(size: 16), isShadow: true, cornerRadius: 8, image: Images.appleLogo()!)
    
    private let registrationButton = UIButton(title: "Email", titleColor: .white, backgroundColor: UIColor.buttonDark(), font: Font.sfuiDisplayRegular(size: 16), isShadow: false, cornerRadius: 8)
    
    private let loginButton = UIButton(title: "Войти", titleColor: .red, backgroundColor: UIColor.white, font: Font.sfuiDisplayRegular(size: 16), isShadow: true, cornerRadius: 8)
    
    private var imageCenterXConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startAnimationImageView()
    }
    
    private func setupSubviews() {
        
        self.view.addSubview(logoLabel)
        
        logoLabel.font = Font.sfuiDisplayMedium(size: 48)!
        logoLabel.text = "iGid"
        logoLabel.textColor = .black
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        logoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -25).isActive = true
        logoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 140).isActive = true

        let googleAuthView = ButtonFormView(label: getStartedLabel, button: googleButton)
        
        self.view.addSubview(googleAuthView)
        
        NSLayoutConstraint.activate([
            googleAuthView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            googleAuthView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
//            googleAuthView.heightAnchor.constraint(equalToConstant: 90),
            googleAuthView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        ])
        
        let appleAuthView = ButtonFormView(label: UILabel(), button: appleButton)
        
        self.view.addSubview(appleAuthView)
        
        NSLayoutConstraint.activate([
            appleAuthView.topAnchor.constraint(equalTo: googleAuthView.bottomAnchor, constant: 0),
            appleAuthView.leadingAnchor.constraint(equalTo: googleAuthView.leadingAnchor),
            appleAuthView.trailingAnchor.constraint(equalTo: googleAuthView.trailingAnchor),
            appleAuthView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        
//        let registrationView = ButtonFormView(label: registrationLabel, button: registrationButton)
//
//        self.view.addSubview(registrationView)
//
//        NSLayoutConstraint.activate([
//            registrationView.topAnchor.constraint(equalTo: appleAuthView.bottomAnchor, constant: 30),
//            registrationView.leadingAnchor.constraint(equalTo: appleAuthView.leadingAnchor),
//            registrationView.trailingAnchor.constraint(equalTo: appleAuthView.trailingAnchor),
//        ])
//
//        let loginView = ButtonFormView(label: loginLabel, button: loginButton)
//
//        self.view.addSubview(loginView)
//
//        NSLayoutConstraint.activate([
//             loginView.topAnchor.constraint(equalTo: registrationView.bottomAnchor, constant: 30),
//             loginView.leadingAnchor.constraint(equalTo: appleAuthView.leadingAnchor),
//             loginView.trailingAnchor.constraint(equalTo: appleAuthView.trailingAnchor),
//             loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60)
//         ])
//
        self.view.addSubview(logoImageView)

        logoImageView.clipsToBounds = true
        logoImageView.layer.cornerRadius = 0
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = Images.launchScreenImage()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageCenterXConstraint = logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        logoImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        NSLayoutConstraint.activate([imageCenterXConstraint])
        
        self.view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 60).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        googleButton.addTarget(self, action: #selector(authWithGoogleClick), for: .touchUpInside)
    }
    
    private func startAnimationImageView() {
        imageCenterXConstraint.isActive = false
        let x = self.logoLabel.frame.midX + 50
        let y = self.logoLabel.frame.minY - 7
        
        UIView.animate(withDuration: 0.5, animations: {
            self.activityIndicator.isHidden = true
            self.logoImageView.frame = CGRect(x: x, y: y, width: 70, height: 70)
            self.logoImageView.layer.cornerRadius = 35
            self.logoImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.view.layoutIfNeeded()
        }) { (finished) in
            if finished {
                UIView.animate(withDuration: 0.2) {
                    self.logoImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
        
    }
    
    @objc private func authWithGoogleClick() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @objc private func authWithAppleIdClick() {
         
    }
    
    @objc private func registrationClick() {

    }
    
    @objc private func inputClick() {
        
    }
    
}

extension AuthViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        AuthService.shared.loginWithGoogle(user: user, error: error) { (result) in
            switch result {
            case .success(let user):
                print(user.displayName)
                print(user.email)
            case .failure(let error):
                dump(error)
            }
        }
    }
    
}
