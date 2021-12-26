//
//  CircleButton.swift
//  Calculator
//
//  Created by out-nazarov2-ms on 16.09.2021.
//

import UIKit

class OpeationButton: CalculatorButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundImage(UIImage(color: .orange), for: .normal)
        setBackgroundImage(UIImage(color: .orange.modified(additionalBrightness: 0.3)), for: .highlighted)
        titleLabel?.font = .boldSystemFont(ofSize: 40 * verticalTranslation)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            titleLabel?.font = .boldSystemFont(ofSize: 30 * verticalTranslation)
        } else {
            titleLabel?.font = .boldSystemFont(ofSize: 40 * verticalTranslation)
        }
    }
}

class DigitButton: CalculatorButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            titleLabel?.font = .systemFont(ofSize: 20 * verticalTranslation)
        } else {
            titleLabel?.font = .systemFont(ofSize: 40 * verticalTranslation)
        }
    }
}

class AdditionButton: CalculatorButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundImage(UIImage(color: .lightGray), for: .normal)
        setBackgroundImage(UIImage(color: .lightGray.modified(additionalBrightness: 0.3)), for: .highlighted)
        titleLabel?.font = .systemFont(ofSize: 30 * verticalTranslation)
        setTitleColor(.black, for: .normal)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if UIDevice.current.orientation.isLandscape {
            titleLabel?.font = .systemFont(ofSize: 20 * verticalTranslation)
        } else {
            titleLabel?.font = .systemFont(ofSize: 30 * verticalTranslation)
        }
    }
}

class CalculatorButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 40 * verticalTranslation)
        setBackgroundImage(UIImage(color: .darkGray), for: .normal)
        setBackgroundImage(UIImage(color: .darkGray.modified(additionalBrightness: 0.3)), for: .highlighted)
        clipsToBounds = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
    }

    static func generateButton(for key: String) -> CalculatorButton {
        if ("0" ... "9").contains(key) || key == .comma {
            let button = DigitButton()
            button.setTitle(key, for: .normal)
            return button
        } else if operations.contains(key) {
            let button = OpeationButton()
            button.setTitle(key, for: .normal)
            return button
        } else if additions.contains(key) {
            let button = AdditionButton()
            button.setTitle(key, for: .normal)
            return button
        } else {
            let button = CalculatorButton()
            button.setTitle(key, for: .normal)
            return button
        }
    }
}
