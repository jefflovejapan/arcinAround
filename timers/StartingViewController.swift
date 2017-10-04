//
//  StartingViewController.swift
//  timers
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let button = UIButton.button(withText: "Push", pinnedToCenterOf: view)
        button.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
    }

    @objc private func pushVC() {
        let vc = ColorViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

