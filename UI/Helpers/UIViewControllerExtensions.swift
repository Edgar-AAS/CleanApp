//
//  UIViewControllerExtensions.swift
//  UI
//
//  Created by Leonardo Almeida on 23/01/23.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardTap() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.cancelsTouchesInView = false //eliminando problema de conflito com tableview
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
