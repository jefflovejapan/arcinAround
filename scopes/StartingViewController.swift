//
//  StartingViewController.swift
//  scopes
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

import UIKit
import RxSwift
import RxCocoa

class StartingViewController: UIViewController {
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let button = UIButton.button(withText: "Push", pinnedToCenterOf: view)
        button.rx.tap.asDriver().drive(onNext: { _ in
            let vc = StarWarsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        })
            .disposed(by: disposeBag)
    }
}
