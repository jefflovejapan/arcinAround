//
//  ViewController.swift
//  timers
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    var button: UIButton!
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .random()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setRandomColor), userInfo: nil, repeats: true)
    }

    @objc private func setRandomColor() {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            self.view.backgroundColor = UIColor.random()
        }, completion: nil)
    }
}

