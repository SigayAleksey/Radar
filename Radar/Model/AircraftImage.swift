//
//  AircraftImage.swift
//  Radar
//
//  Created by Алексей Сигай on 19/01/2019.
//  Copyright © 2019 Алексей Сигай. All rights reserved.
//

import UIKit

class AircraftImage: UIImageView {
    
    init(customImage: UIImage, frame: CGRect) {
        super.init(frame: frame)
        super.image = customImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
