//
//  ViewController.swift
//  instanceMethods
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    var disposeBag = DisposeBag()
    var textField: UITextField!
    var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)


        textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .orange
        view.addSubview(textView)

        textField.rx.controlEvent(.editingDidEndOnExit)
            .asDriver()
            .map(getText)
            .drive(textView.rx.text)
            .disposed(by: disposeBag)

        for subview in [textField, textView] as [UIView] {
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(in)-[view]-(in)-|", options: [], metrics: ["in": 16], views: ["view": subview]))
        }

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[field]-(sp)-[text]", options: [], metrics: ["sp": 16], views: ["safe": view.safeAreaLayoutGuide, "field": textField, "text": textView]))
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true

    }

    private func getText() -> String? {
        return textField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

