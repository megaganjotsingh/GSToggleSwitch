//
//  ToggleSwitch.swift
//  ToggleSwitch
//
//  Created by Admin on 01/05/23.
//

import Foundation
import UIKit

struct ToggleProperties {
    var width: CGFloat = 80
    var height: CGFloat = 40
    var cornerRadius: CGFloat = 20
    var backgroundColor: UIColor = .gray
    var onBackgroundColor: UIColor = .yellow
    var thumbProperties: ThumbProperties = .init()
    
    struct ThumbProperties {
        var backgroundColor: UIColor = .red
        var showThumbShadow: Bool = true
    }
}

class ToggleSwitch: UIView {
    enum State {
        case on
        case off
    }
    
    var thumb: UIView = .init()
    var onBackgroundView: UIView = .init()
    var tapOnSwitch: (() -> (State?))?
    var properties = ToggleProperties() {
        didSet {
            updateAllProperties()
        }
    }
    var currentState: State {
        get {
            thumb.frame.origin.x == 0 ? .off : .on
        }
        set {
            changeSwitch(onSelect: newValue)
        }
    }
    
    var oppositeState: State {
        currentState == .on ? .off : .on
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    convenience init(properties: @escaping (inout ToggleProperties) -> (), tapOnSwitch: @escaping () -> (State?)) {
        self.init(frame: .zero)
        self.tapOnSwitch = tapOnSwitch
        properties(&self.properties)
        setupUI()
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: properties.width, height: properties.height)
    }
    
    func addSubviews() {
        addSubview(onBackgroundView)
        addSubview(thumb)
    }
    
    func addFrames() {
        frame = CGRect(origin: .zero, size: CGSize(width: properties.width, height: properties.height))
        thumb.frame = CGRect(origin: .zero, size: CGSize(width: properties.height, height: properties.height))
        onBackgroundView.frame = CGRect(origin: .zero, size: CGSize(width: 0, height: properties.height))
    }
    
    func setupUI() {
        addSubviews()
        addFrames()
        addTapGesture()
        updateAllProperties()
    }
    
    func updateAllProperties() {
        selfProperties()
        thumbProperties()
        backgroundViewProperties()
    }
    
    func selfProperties() {
        backgroundColor = properties.backgroundColor
        layer.cornerRadius = properties.cornerRadius
        layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.masksToBounds = false
        layer.shadowRadius = 3
    }
    
    func thumbProperties() {
        thumb.layer.cornerRadius = properties.cornerRadius
        thumb.backgroundColor = properties.thumbProperties.backgroundColor
        if properties.thumbProperties.showThumbShadow {
            thumb.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
            thumb.layer.masksToBounds = false
            thumb.layer.shadowRadius = 3
            thumb.layer.shadowOffset = .zero
            thumb.layer.shadowOpacity = 1
        }
    }
    
    func backgroundViewProperties() {
        onBackgroundView.layer.cornerRadius = properties.cornerRadius
        onBackgroundView.backgroundColor = properties.onBackgroundColor
    }
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnSwitch(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    @objc
    func tapOnSwitch(_ gesture: UITapGestureRecognizer) {
        let action = tapOnSwitch?()
        changeSwitch(onSelect: action ?? .off)
    }
    
    func changeSwitch(onSelect state: State) {
        let xTransition = state == .on ? properties.width - properties.height : 0
        let onBackgroundWidth = state == .on ? properties.width : properties.height
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.thumb.frame.origin.x = xTransition
            self?.onBackgroundView.frame.size.width = onBackgroundWidth
        }
    }
}
