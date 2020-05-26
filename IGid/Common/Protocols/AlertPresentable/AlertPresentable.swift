//
//  AlertPresentable.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

protocol AlertPresentable: class {
    func showAlert(title: String?, message: String?, actions: [AlertAction], style: UIAlertController.Style)
    func showAlert(title: String?, message: String?, actions: [AlertAction])
}

extension AlertPresentable where Self: UIViewController {
    
    func showAlert(title: String?, message: String?, actions: [AlertAction]) {
        showAlert(title: title, message: message, actions: actions, style: .alert)
    }
    
    func showAlert(title: String?, message: String?, actions: [AlertAction], style: UIAlertController.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let alertActions = actions.map { (action) in
            return UIAlertAction(title: action.title, style: action.style, handler: { (_) in
                action.action?()
            })
        }
        
        alertActions.forEach {
            alert.addAction($0)
        }
        
        present(alert, animated: true, completion: nil)
    }
}
