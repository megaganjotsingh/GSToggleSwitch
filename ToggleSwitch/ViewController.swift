//
//  ViewController.swift
//  ToggleSwitch
//
//  Created by Admin on 01/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var toggle: ToggleSwitch?
    var tapNum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupToggle()
    }

    func setupToggle() {
        toggle = .init(
            properties: { prop in
                prop.width = 40
                prop.height = 20
                prop.cornerRadius = 10
                prop.thumbBackgroundColor = .white
                prop.onBackgroundColor = .green
                prop.showThumbShadow = true
            },
            tapOnSwitch: { [weak self] in
                guard let self = self else { return .off }
                self.showAlert()
                return self.toggle?.currentState ?? .off
            }
        )
        guard let toggle = toggle else { return }
        toggle.currentState = .on
        view.addSubview(toggle)
        toggle.center = CGPoint(x: 200, y: 200)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Change", message: "Change the current state by tapping yes and tap no to dismiss the alert", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            self?.toggle?.currentState = self?.toggle?.oppositeState ?? .on
        }
        let noAction = UIAlertAction(title: "No", style: .default)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
}

