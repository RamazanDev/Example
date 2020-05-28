//
//  UIViewController+NavigationBar.swift
//  IGid
//
//  Created by Рамазан on 28.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UIViewController {
    func setLargeStyleToNavigationBar() {
        let nav = navigationController?.navigationBar
        nav?.prefersLargeTitles = true
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textBlack()]

        let style = UINavigationBarAppearance()
        style.configureWithDefaultBackground()

        style.titleTextAttributes = [.font: Font.sfuiDisplayRegular(size: 18)!]

        nav?.standardAppearance = style
        nav?.compactAppearance = style


        //Configure Large Style
        let largeStyle = UINavigationBarAppearance()
        largeStyle.configureWithTransparentBackground()

        largeStyle.largeTitleTextAttributes = [.font: Font.sfuiDisplayBold(size: 28)!]

        nav?.scrollEdgeAppearance = largeStyle
        
    }
}
