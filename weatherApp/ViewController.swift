//
//  ViewController.swift
//  weatherApp
//
//  Created by Егор Абрамов on 03.06.2024.
//

import UIKit

/*
 Чтобы добавить UI элемент надо:
    1. создать необходимый элемент
    2. добавить на view (view.addSubview(label))
    3. добавить необходимые ограничения(необходимо вызвать: .isActive = true)
    4. не забыть вызвать функцию
*/

final class ViewController: UIViewController {
    
    // MARK: Private UI properties
    
    private let topContentView: TopContentView = {
        let view = TopContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Задаем дефолтные данные
        topContentView.set(location: "Moscow", temperature: 21, condition: "Partly Cloudy", minTemp: 15, maxTemp: 29)
    }
    
    // MARK: Private methods

    private func setupView() {
        view.backgroundColor = .black

        view.addSubview(topContentView)
        topContentView.translatesAutoresizingMaskIntoConstraints = false
        topContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        topContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34).isActive = true
        topContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        topContentView.heightAnchor.constraint(equalToConstant: 195).isActive = true
    }
}
