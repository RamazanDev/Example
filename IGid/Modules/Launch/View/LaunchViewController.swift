//
//  LaunchViewController.swift
//  IGid
//
//  Created by Магомедов Рамазан on 04.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit
import Rswift

final class LaunchViewController: UIViewController {
    
    private var backgroundImageView: UIImageView!
    
    var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setupSubviews() {
        backgroundImageView = UIImageView(frame: .zero)
        self.view.addSubview(backgroundImageView)
        
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = Images.launchScreenImage()
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor)
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        NSLayoutConstraint.activate([topConstraint])
        
    }
    
    private func startAnimation() {
        
    }
    
}
