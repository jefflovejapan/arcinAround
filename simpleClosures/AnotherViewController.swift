//
//  AnotherViewController.swift
//  simpleClosures
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {
    var onButtonTap: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan

        let button = UIButton.button(withText: "pop", pinnedToCenterOf: view)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc private func handleButtonTap() {
        onButtonTap?()
    }
}
