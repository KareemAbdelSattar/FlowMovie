//
//  UIViewController + Ext.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//

import UIKit

extension UIViewController {
    func fadeInAnimation() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        self.view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func showAlertView(with msg: String) {
        let alerViewController = UIAlertController(title: "Warning", message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alerViewController.addAction(cancelAction)
        self.present(alerViewController, animated: true)
    }
}
