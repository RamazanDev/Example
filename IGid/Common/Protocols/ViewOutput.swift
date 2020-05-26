//
//  ViewOutput.swift
//  IGid
//
//  Created by Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import Foundation

protocol ViewOutput: AnyObject {
    
    func viewIsReady()
    func viewWillAppear()
    func viewWillDisappear()
    func deInit()
    func didTapDismissButton()
    func viewWillDeinit()
}

extension ViewOutput {
    
    // MARK: - Default implementation
    
    func viewIsReady() { }
    func viewWillAppear() { }
    func viewWillDisappear() { }
    func deInit() { }
    func didTapDismissButton() { }
    func viewWillDeinit() { }
}
