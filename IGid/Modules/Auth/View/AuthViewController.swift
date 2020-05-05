//
//  AuthViewController.swift
//  IGid
//
//  Created by Магомедов Рамазан on 01.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private let inputButton = UIButton()
    private let logoImageView = UIImageView()
    private let logoLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView()
    
    private var imageCenterXConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print(self.activityIndicator.frame)
            self.startAnimationImageView()
        }
    }
    
    private func setupSubviews() {
        
        self.view.addSubview(logoLabel)
        
        logoLabel.font = Font.sfuiDisplayRegular(size: 40)!
        logoLabel.text = "IGid"
        logoLabel.textColor = .black
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        logoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -25).isActive = true
        logoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 140).isActive = true
        
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
        
    }
    
    private func startAnimationImageView() {
        imageCenterXConstraint.isActive = false
        let x = self.logoLabel.frame.midX + 40
        let y = self.logoLabel.frame.minY
        
        UIView.animate(withDuration: 0.8) {
            self.activityIndicator.isHidden = true
            self.logoImageView.frame = CGRect(x: x, y: y, width: 50, height: 50)
            self.logoImageView.layer.cornerRadius = 25
            self.view.layoutIfNeeded()
        }
        
    }
    
}
