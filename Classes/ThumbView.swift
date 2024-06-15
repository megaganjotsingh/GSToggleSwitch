//
//  ThumbView.swift
//  ToggleSwitch
//
//  Created by apple on 04/05/23.
//

import Foundation
import UIKit.UIView

open class ThumbView: UIView {
    open var properties: ToggleProperties.ThumbProperties = .init(cornerRadius: 10)
    
    private var imageView: UIImageView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        updateProperties()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
        updateProperties()
    }
    
    func setUpUI() {
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }
    
    open override func layoutSubviews() {
        imageView.frame = CGRect(origin: CGPoint(x: 4, y: 4), size: CGSize(width: frame.width - 8, height: frame.height - 8))
    }
    
    func updateProperties() {
        layer.cornerRadius = properties.cornerRadius
        backgroundColor = properties.backgroundColor
        if properties.showThumbShadow {
            layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
            layer.masksToBounds = false
            layer.shadowRadius = 3
            layer.shadowOffset = .zero
            layer.shadowOpacity = 1
        }
    }
    
    func setImage(withState state: GSToggleSwitchView.State) {
        let image = state == .on ? properties.thumbOnImage : properties.thumbOffImage
        UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
            self?.imageView.image = image
        }
    }
}
