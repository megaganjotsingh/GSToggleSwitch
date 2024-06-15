//
//  ToggleProperties.swift
//  ToggleSwitch
//
//  Created by apple on 04/05/23.
//

import Foundation
import UIKit.UIColor

public struct ToggleProperties {
    public var width: CGFloat = 60
    public var height: CGFloat = 30
    public var cornerRadius: CGFloat = 15
    public var backgroundColor: UIColor = .gray
    public var onBackgroundColor: UIColor = .yellow
    public lazy var thumbProperties: ThumbProperties = .init(cornerRadius: cornerRadius)
    
    public struct ThumbProperties {
        public var backgroundColor: UIColor = .red
        public var showThumbShadow: Bool = true
        public var thumbOffImage: UIImage?
        public var thumbOnImage: UIImage?
        public var cornerRadius: CGFloat
    }
}
