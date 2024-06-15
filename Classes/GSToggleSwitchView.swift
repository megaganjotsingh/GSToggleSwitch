//
//  ToggleSwitch.swift
//  ToggleSwitch
//
//  Created by Admin on 01/05/23.
//

import Foundation
import UIKit.UIView

open class GSToggleSwitchView: UIView {
    public enum State {
        case on
        case off
    }
    
    public var thumb: ThumbView = .init()
    public var onBackgroundView: UIView = .init()
    open var tapOnSwitch: (() -> (State?))?
    open var properties = ToggleProperties()
    public var currentState: State {
        get {
            thumb.frame.origin.x == 0 ? .off : .on
        }
        set {
            changeSwitch(onSelect: newValue)
        }
    }
    
    public var oppositeState: State {
        currentState == .on ? .off : .on
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
//        setupUI()
    }
    
    public func set(properties: @escaping (inout ToggleProperties) -> (), tapOnSwitch: @escaping () -> (State?)) {
        self.tapOnSwitch = tapOnSwitch
        properties(&self.properties)
        thumb.properties = self.properties.thumbProperties
        setupUI()
    }
    
    open override var intrinsicContentSize: CGSize {
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
        thumb.updateProperties()
        backgroundViewProperties()
    }
    
    func selfProperties() {
        backgroundColor = properties.backgroundColor
        layer.cornerRadius = properties.cornerRadius
        layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.masksToBounds = false
        layer.shadowRadius = 3
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
            self?.thumb.setImage(withState: state)
        }
    }
}
