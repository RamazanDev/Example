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
    
    private var imageCenterYConstraint: NSLayoutConstraint!
    private var imageHeightConstraint: NSLayoutConstraint!
    private var imageWidthConstraint: NSLayoutConstraint!
    private var imageLeftAnchorConstraint: NSLayoutConstraint!
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
        startAnimationImageView()
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
        
        imageCenterYConstraint = logoImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        imageCenterXConstraint = logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        imageHeightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height)
        imageWidthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width)
        NSLayoutConstraint.activate([imageCenterYConstraint,
                                     imageCenterXConstraint,
                                     imageHeightConstraint,
                                     imageWidthConstraint])
        
    }
    
    private func startAnimationImageView() {
        
        imageLeftAnchorConstraint = logoImageView.leftAnchor.constraint(equalTo: self.logoLabel.rightAnchor, constant: 8)
        imageHeightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 50)
        imageWidthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 50)
        imageCenterYConstraint = logoImageView.centerYAnchor.constraint(equalTo: self.logoLabel.centerYAnchor)
        imageCenterXConstraint.isActive = false
        
        let x = self.logoLabel.frame.midX + 50
        let y = self.logoLabel.frame.minY
        
        UIView.animate(withDuration: 0.5) {
//            NSLayoutConstraint.activate([self.imageWidthConstraint,
//                                         self.imageHeightConstraint,
//                                         self.imageLeftAnchorConstraint,
//                                         self.imageCenterYConstraint])
            self.logoImageView.frame = CGRect(x: x, y: y, width: 50, height: 50)
            self.logoImageView.layer.cornerRadius = 25
            self.view.layoutIfNeeded()
        }
        
    }
    
}
