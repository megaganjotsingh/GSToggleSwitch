//
//  ToggleProperties.swift
//  ToggleSwitch
//
//  Created by apple on 04/05/23.
//

import Foundation
import UIKit.UIColor

struct ToggleProperties {
    var width: CGFloat = 60
    var height: CGFloat = 30
    var cornerRadius: CGFloat = 15
    var backgroundColor: UIColor = .gray
    var onBackgroundColor: UIColor = .yellow
    lazy var thumbProperties: ThumbProperties = .init(cornerRadius: cornerRadius)
    
    struct ThumbProperties {
        var backgroundColor: UIColor = .red
        var showThumbShadow: Bool = true
        var thumbOffImage: UIImage?
        var thumbOnImage: UIImage?
        var cornerRadius: CGFloat
    }
}
