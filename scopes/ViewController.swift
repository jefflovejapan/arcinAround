//
//  ViewController.swift
//  scopes
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class StarWarsViewController: UITableViewController {
    var disposeBag = DisposeBag()
    var textField: UITextField!
    var textView: UITextView!
    let session = URLSession.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.register(UITableViewCell.self)

        getPerson()
            .map { return $0.films.map { [weak self] filmURL -> Observable<Film> in
                guard let welf = self else { return Observable.error("no self!") }
                return welf.getFilm(url: filmURL)
                }
            }
            .map { Observable.combineLatest($0, Array.init) }
            .switchLatest()
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellType: UITableViewCell.self)) { (index: Int, film: Film, cell: UITableViewCell) in
                cell.textLabel?.text = film.title
            }
            .disposed(by: disposeBag)
    }

    func getPerson() -> Observable<Person> {
        let url = URL(string: "https://swapi.co/api/people/1/")!
        let request = URLRequest(url: url)
        return session.rx.data(request: request)
            .map { (data) -> Person in
                let decoder = JSONDecoder()
                return try decoder.decode(Person.self, from: data)
        }
    }

    func getFilm(url: URL) -> Observable<Film> {
        let request = URLRequest(url: url)
        return session.rx.data(request: request)
            .map { (data) -> Film in
                let decoder = JSONDecoder()
                return try decoder.decode(Film.self, from: data)
        }
    }
}



