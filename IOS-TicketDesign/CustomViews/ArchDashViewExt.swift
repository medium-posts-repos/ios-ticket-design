//
//  ArchDashViewExt.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit

public extension UIView {
    func toArchDashline(radius: CGFloat, fillColor: UIColor? = nil) {
        let ticketShapeLayer = CAShapeLayer()
        ticketShapeLayer.frame = self.bounds
        ticketShapeLayer.fillColor = fillColor?.cgColor
        layer.masksToBounds = true

        let ticketShapePath = UIBezierPath(roundedRect: bounds, cornerRadius: 0)
        
        /* x: -4 and x: +4 => to memic oval like shape instead of semi circle */
        let topLeftArcPath = UIBezierPath(arcCenter: CGPoint(x: -4, y: self.bounds.height/2),
                                          radius: radius,
                                          startAngle: .pi/2,
                                          endAngle: .pi + .pi/2,
                                          clockwise: false)
        
        topLeftArcPath.close()
        
        let topRightArcPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width + 4, y: self.bounds.height/2),
                                           radius: radius,
                                           startAngle:  .pi/2,
                                           endAngle: .pi + .pi/2,
                                           clockwise: true)
        topRightArcPath.close()
        
        let lineDashPatterns: [NSNumber] = [10, 5, 5, 5]
        let lineDashShapeLayer = CAShapeLayer()
        lineDashShapeLayer.strokeColor = UIColor.darkGray.cgColor
        lineDashShapeLayer.lineWidth = 2
        lineDashShapeLayer.lineDashPattern = lineDashPatterns
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 12, y: self.bounds.height/2),
                                CGPoint(x: bounds.width - 12, y: self.bounds.height/2)])
        lineDashShapeLayer.path = path

        
        ticketShapePath.append(topLeftArcPath)
        ticketShapePath.append(topRightArcPath.reversing())
        
        ticketShapeLayer.path = ticketShapePath.cgPath
        
        layer.insertSublayer(ticketShapeLayer, at: 0)
        layer.addSublayer(lineDashShapeLayer)
    }
    
    /* make `n` number of rainbow curves*/
    func toRainbowsArcLayer(radius: CGFloat) {
        let radius = radius
        let lineWidth: CGFloat = .init(7)
        let eachArcWidth = CGFloat((radius * 2) + 8)
        let numberOfArcs = Int(((bounds.width - 32) / eachArcWidth).rounded(.up))
        
        var lastXPosition: CGFloat = CGFloat(12 + radius)
        
        let archShapeLayer = CAShapeLayer()
        archShapeLayer.frame = self.bounds
        archShapeLayer.fillColor = UIColor.white.cgColor
        layer.masksToBounds = true
        
        let archShapePath = UIBezierPath(roundedRect: bounds, cornerRadius: 0)
                        
        for i in 1...numberOfArcs {
            let result = toRainbowCurveAndLine(x: lastXPosition, y: bounds.height + 2, diameter: CGFloat(2 * radius), lineWidth: i == numberOfArcs ? .zero : lineWidth)
            archShapePath.append(result.path)
            lastXPosition = result.endPoint
        }
        
        archShapeLayer.path = archShapePath.cgPath
        layer.insertSublayer(archShapeLayer, at: 0)
    }
    
    /* make rainbow curve*/
    func toRainbowCurveAndLine(x: CGFloat, y: CGFloat, diameter: CGFloat, lineWidth: CGFloat) -> (path: UIBezierPath, endPoint: CGFloat) {
        let path = UIBezierPath(arcCenter: CGPoint(x: x, y: y),
                     radius: diameter/2,
                                startAngle: 2 * .pi,
                                endAngle: .pi,
                     clockwise: false)
        
        let endPoint = CGPoint(x: x + diameter + lineWidth, y: y)
        path.addLine(to: endPoint)
        path.close()
        
        return (path, x + diameter + lineWidth)
    }
}
