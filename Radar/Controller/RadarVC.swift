//
//  RadarVC.swift
//  Radar
//
//  Created by Алексей Сигай on 15/01/2019.
//  Copyright © 2019 Алексей Сигай. All rights reserved.
//

import UIKit

class RadarVC: UIViewController {
    
    let ringsCount = 20
    let aircraftsCount = 100
    let aircraftImage = UIImage(named: "imgAircraft")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spaceBetweenRings = Calculation.spaceBetweenRings(screenWidth: view.frame.width, ringsCount: ringsCount)

        view.backgroundColor = UIColor.darkGray
        displayRings(ringsCount: ringsCount, spaceBetweenRings: spaceBetweenRings)
        displayAircrafts(aircraftsCount: aircraftsCount, ringsCount: ringsCount, spaceBetweenRings: spaceBetweenRings)
    }

    
    func displayRings(ringsCount: Int, spaceBetweenRings: Int) {
        let minimumDiameter = spaceBetweenRings * 2
        var currentDiameter = minimumDiameter
        let viewCenter = view.center
        
        for _ in 1...ringsCount {
            let originRing = CGPoint(x: (viewCenter.x - CGFloat(currentDiameter / 2)), y: (viewCenter.y - CGFloat(currentDiameter / 2)))
            let frame = CGRect(origin: originRing, size: CGSize(width: currentDiameter, height: currentDiameter))
            let ring = Ring(diameter: currentDiameter, frame: frame)
            view.addSubview(ring)
            currentDiameter += minimumDiameter
        }
    }
    
    func displayAircrafts(aircraftsCount: Int, ringsCount: Int, spaceBetweenRings: Int) {
        if aircraftsCount != 0 {
            let radarData = Calculation.radarData(aircraftsCount: aircraftsCount, ringsCount: ringsCount, spaceBetweenRings: spaceBetweenRings)
            
            let sizeImage = CGFloat(spaceBetweenRings - 2)
            let sizeImageHalf = sizeImage / 2
            let viewCenter = view.center
            
            for aircraft in 0...aircraftsCount - 1 {
                
                let centerX = viewCenter.x + CGFloat(radarData[aircraft].position.xPosition) - sizeImageHalf
                let centerY = viewCenter.y + CGFloat(radarData[aircraft].position.yPosition) - sizeImageHalf
                let frame = CGRect(x: centerX, y: centerY, width: sizeImage, height: sizeImage)
                
                let imageView = AircraftImage(customImage: aircraftImage!, frame: frame)
                view.addSubview(imageView)
            }
        }
    }

}
