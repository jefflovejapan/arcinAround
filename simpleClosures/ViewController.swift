//
//  ViewController.swift
//  simpleClosures
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton.button(withText: "push", pinnedToCenterOf: view)
        button.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
    }

    @objc private func pushVC() {
        let vc = AnotherViewController()
        vc.onButtonTap = { vc.navigationController?.popViewController(animated: true) }
        navigationController?.pushViewController(vc, animated: true)
    }
}

