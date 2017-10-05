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

class TextViewController: UIViewController {
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

        doLayout()
    }

    private func getText() -> String? {
        return textField.text
    }
}

