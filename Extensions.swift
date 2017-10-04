//
//  Extensions.swift
//  simpleClosures
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIButton {
    static func button(withText text: String, pinnedToCenterOf view: UIView) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitleColor(.black, for: .normal)
        button.setTitle(text, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return button
    }
}

extension String: Error {}

extension Reactive where Base: UITableView {
    /// Extra sugar to enforce cell type names as reuse identifiers
    ///
    /// - Parameter cellType: a `UITableViewCell` subclass
    /// - Returns: disposable object that can be used to unbind
    public func items<S: Sequence, Cell: UITableViewCell, O: ObservableType>(cellType: Cell.Type = Cell.self)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, Cell) -> Void)
        -> Disposable where O.E == S {
            return self.items(cellIdentifier: String(describing: cellType), cellType: cellType)
    }
}

extension UITableView {
    func register(_ cellType: AnyClass) {
        self.register(cellType, forCellReuseIdentifier: String(describing: cellType))
    }
}

extension UIColor {
    static func random() -> UIColor {
        let random255 = { CGFloat(arc4random_uniform(255)) / 255.0 }
        let (r, g, b) = (random255(), random255(), random255())
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
