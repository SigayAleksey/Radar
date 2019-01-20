//
//  Ring.swift
//  Radar
//
//  Created by Алексей Сигай on 16/01/2019.
//  Copyright © 2019 Алексей Сигай. All rights reserved.
//

import UIKit

class Ring: UIView {
    
    let diameter: Int

    init(diameter: Int, frame: CGRect) {
        self.diameter = diameter
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        layer.borderWidth = 1
        layer.cornerRadius = CGFloat(diameter / 2)
        layer.borderColor = UIColor(red: 0.5, green: 0.8, blue: 0.5, alpha: 0.6).cgColor
    }
}
