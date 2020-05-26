//
//  AlertAction.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let action: (() -> Void)?
}

let AlertCancelAction = AlertAction(title: Localized.cancel(), style: .cancel, action: nil)
