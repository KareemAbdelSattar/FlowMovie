//
//  UINavigationBar + Ext.swift
//  Ibtikar
//
//  Created by Kareemchetoos on 6/8/21.
//

import UIKit

extension UINavigationBar {
    func setColors(background: UIColor = .white, text: UIColor = .white) {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = background
            appearance.titleTextAttributes = [.foregroundColor: text]
            standardAppearance = appearance
            scrollEdgeAppearance = standardAppearance
        } else {
            isTranslucent = false
            backgroundColor = background
            barTintColor = background
            setBackgroundImage(UIImage(), for: .default)
            titleTextAttributes = [.foregroundColor: text]
        }
    }
}
