//
//  TextViewController+Layout.swift
//  instanceMethods
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

extension TextViewController {
    func doLayout() {
        for subview in [textField, textView] as [UIView] {
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(in)-[view]-(in)-|", options: [], metrics: ["in": 16], views: ["view": subview]))
        }

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[field]-(sp)-[text]", options: [], metrics: ["sp": 16], views: ["safe": view.safeAreaLayoutGuide, "field": textField, "text": textView]))
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
}
