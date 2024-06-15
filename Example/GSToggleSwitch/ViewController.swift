//
//  ViewController.swift
//  GSToggleSwitch
//
//  Created by megaganjotsingh on 06/12/2024.
//  Copyright (c) 2024 megaganjotsingh. All rights reserved.
//

import UIKit
import GSToggleSwitch

class ViewController: UIViewController {
    
    var toggle1 = GSToggleSwitchView()
    var toggle2 = GSToggleSwitchView()
    @IBOutlet var toggle3: GSToggleSwitchView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupToggle1()
        setupToggle2()
        setupToggle3()
    }

    func setupToggle1() {
        toggle1.set(
            properties: { prop in
                prop.width = 40
                prop.height = 20
                prop.cornerRadius = 10
                prop.onBackgroundColor = .green
                prop.thumbProperties.showThumbShadow = true
                prop.thumbProperties.backgroundColor = .white
            },
            tapOnSwitch: { [weak self] in
                guard let self = self else { return .off }
                self.showAlert()
                return self.toggle1.currentState
            }
        )
        toggle1.currentState = .on
        view.addSubview(toggle1)
        toggle1.center = CGPoint(x: 200, y: 200)
    }
    
    func setupToggle2() {
        toggle2.set(
            properties: { prop in
                prop.onBackgroundColor = .systemBlue.withAlphaComponent(0.15)
                prop.thumbProperties.showThumbShadow = true
                prop.thumbProperties.backgroundColor = .white
                prop.thumbProperties.thumbOnImage = UIImage(named: "sun")
                prop.thumbProperties.thumbOffImage = UIImage(named: "moon")
            },
            tapOnSwitch: { [weak self] in
                guard let self = self else { return .off }
                return self.toggle2.oppositeState
            }
        )
        toggle2.currentState = .on
        view.addSubview(toggle2)
        toggle2.center = CGPoint(x: 200, y: 250)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Change", message: "Change the current state by tapping yes and tap no to dismiss the alert", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            self?.toggle1.currentState = self?.toggle1.oppositeState ?? .on
        }
        let noAction = UIAlertAction(title: "No", style: .default)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
    
    func setupToggle3() {
        toggle3.set(
            properties: { prop in
                prop.width = 45 // same width as given in storyboard
                prop.height = 20 // same height as given in storyboard
                prop.cornerRadius = 5
                prop.onBackgroundColor = .red
                prop.thumbProperties.showThumbShadow = true
                prop.thumbProperties.backgroundColor = .white
            },
            tapOnSwitch: { [weak self] in
                guard let self = self else { return .off }
                return self.toggle3.oppositeState
            }
        )
        toggle3.currentState = .on
    }
}
