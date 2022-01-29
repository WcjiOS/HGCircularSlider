//
//  SquareCircularSlider.swift
//  HGCircularSlider
//
//  Created by 王昌健 on 2022/1/29.
//  Copyright © 2022 intive. All rights reserved.
//

import UIKit

class SquareCircularSlider: CircularSlider {

    override open func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        drawCircularSlider(inContext: context)
        
        let valuesInterval = Interval(min: minimumValue, max: maximumValue, rounds: numberOfRounds)
        // get end angle from end value
        let endAngle = CircularSliderHelper.scaleToAngle(value: endPointValue, inInterval: valuesInterval) + CircularSliderHelper.circleInitialAngle
        
        drawFilledArc(fromAngle: 0, toAngle: endAngle, inContext: context)
        
        // draw end thumb
        endThumbTintColor.setFill()
        (isHighlighted == true) ? endThumbStrokeHighlightedColor.setStroke() : endThumbStrokeColor.setStroke()
        
        drawThumbAt(endAngle, with: endThumbImage, inContext: context)
    }

}
