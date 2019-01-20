//
//  Calculation.swift
//  Radar
//
//  Created by Алексей Сигай on 19/01/2019.
//  Copyright © 2019 Алексей Сигай. All rights reserved.
//

import UIKit

class Calculation {
    
    static func diameter(radius: Int) -> Int {
        return radius * 2
    }
    
    
    static func radius(diameter: Int) -> Int {
        return diameter / 2
    }
    
    
    static func spaceBetweenRings(screenWidth: CGFloat, ringsCount: Int) -> Int {
        return Int((Int(screenWidth) - 20) / (ringsCount * 2))
    }

    
    static func radarData(aircraftsCount: Int, ringsCount: Int, spaceBetweenRings: Int) -> [Aircraft] {

        var radarData = [Aircraft]()
        let sign = [-1.0, 1.0]

        // Calculation of integer radius
        let sectorRadius: [Int] = {
            var array = [Int]()
            var currentRadius = spaceBetweenRings - Int(spaceBetweenRings / 2) - 1
            for _ in 1...ringsCount {
                array.append(currentRadius)
                currentRadius += spaceBetweenRings
            }
            return array
        }()

        for _ in 0...aircraftsCount {
            let sectorNumber = Int(arc4random_uniform(UInt32(ringsCount)))

            let xPosition = (Double(arc4random_uniform(UInt32(sectorRadius[sectorNumber] * 2) * 10)) - Double(sectorRadius[sectorNumber] * 10)) / 10
            let negativeSign = Int(arc4random_uniform(2))
            let yPosition = sqrt(Double(sectorRadius[sectorNumber] * sectorRadius[sectorNumber]) - xPosition * xPosition) * sign[negativeSign]
            let position = Position(xPosition: xPosition, yPosition: yPosition)

            let aircraft = Aircraft(position: position)

            radarData.append(aircraft)
        }

        return radarData
    }
 
}
