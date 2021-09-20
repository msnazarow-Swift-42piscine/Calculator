//
//  ViewController.swift
//  HelloWorld
//
//  Created by out-nazarov2-ms on 20.09.2021.
//

import UIKit

class ViewController: UIViewController {
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Click me", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc private func didButtonTapped() {
        print("Hello World!")
    }
}

