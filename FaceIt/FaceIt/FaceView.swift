//
//  FaceView.swift
//  FaceIt
//
//  Created by Christian Perrone on 29/09/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

@IBDesignable
class FaceView: UIView {
    
    @IBInspectable var scale: CGFloat = 0.90 { didSet { setNeedsDisplay() } }
    @IBInspectable var mouthCurvature: Double = 1.0 { didSet { setNeedsDisplay() } }
    @IBInspectable var eyesOpen: Bool = false { didSet { setNeedsDisplay() } }
    @IBInspectable var eyeBrowTilt: Double = 0.5 { didSet { setNeedsDisplay() } }
    @IBInspectable var color: UIColor = UIColor.blue { didSet { setNeedsDisplay() } }
    @IBInspectable var lineWidth: CGFloat = 5.0 { didSet { setNeedsDisplay() } }

    
    private var skullRadius: CGFloat {
      return min(bounds.size.width, bounds.size.height)/2 * scale
    }
    
    private var skullCenter: CGPoint {
     return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private struct Ratios {
        static let SkullRadiusToEyeOffSet: CGFloat = 3
        static let SkullRadiusToEyeRadius: CGFloat = 10
        static let SkullRadiusToMouthWidth: CGFloat = 1
        static let SkullRadiusToMouthHeight: CGFloat = 3
        static let SkullRadiusToMouthOffset: CGFloat = 3
        static let SkullRadiusToBrowOffset: CGFloat = 5

    }

    private enum Eye {
        case left, right
    }
    
    private func pathForCircleCenteredAtPoint(midpoint: CGPoint, withRadius: CGFloat) -> UIBezierPath {
        
        let path =  UIBezierPath(arcCenter: midpoint, radius: withRadius, startAngle: 0.0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        
        path.lineWidth = lineWidth
        return path
    }
    
    private func getEyeCenter(eye: Eye) -> CGPoint {
        let eyeOffset = skullRadius / Ratios.SkullRadiusToEyeOffSet
        var eyeCenter = skullCenter
        eyeCenter.y -= eyeOffset
        
        switch eye {
        case .left:
            eyeCenter.x -= eyeOffset
        case .right:
            eyeCenter.x += eyeOffset
        }
        
        return eyeCenter
    }
    
    private func pathForEye(eye: Eye) -> UIBezierPath {
        let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
        let eyeCenter = getEyeCenter(eye: eye)
        if eyesOpen {
            return pathForCircleCenteredAtPoint(midpoint: eyeCenter, withRadius: eyeRadius)

        }
        else {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
            path.lineWidth = lineWidth
            return path
        }
    }
    
    private func pathForMouth() -> UIBezierPath {
        let mouthWidth = skullRadius/Ratios.SkullRadiusToMouthWidth
        let mouthHeight = skullRadius/Ratios.SkullRadiusToMouthHeight
        let mouthOffset = skullRadius/Ratios.SkullRadiusToMouthOffset
        
        let mouthRect = CGRect(x: skullCenter.x - mouthWidth/2, y: skullCenter.y + mouthOffset, width: mouthWidth, height: mouthHeight)
        
        let smileOffset = CGFloat(max(-1, min(mouthCurvature, 1))) * mouthRect.height
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.minY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.minY)
        let cp1 = CGPoint(x: mouthRect.minX + mouthRect.width/3, y: mouthRect.minY + smileOffset)
        let cp2 = CGPoint(x: mouthRect.maxX - mouthRect.width/3, y: mouthRect.minY + smileOffset)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = lineWidth
        
        return path
    }
    
    static let SkullRadiusToBrowOffset: CGFloat = 5
    
    private func pathForBrow(eye: Eye) -> UIBezierPath {
        var tilt = eyeBrowTilt
        
        switch eye {
        case .left:
            tilt *= -1.0
        case .right:
            break
        }
        
        var browCenter = getEyeCenter(eye: eye)
        browCenter.y -= skullRadius / Ratios.SkullRadiusToBrowOffset
        let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
        let tiltOffset = CGFloat(max(-1, min(tilt,1))) * eyeRadius / 2
        let browStart  = CGPoint(x: browCenter.x - eyeRadius, y: browCenter.y - tiltOffset)
        let browEnd = CGPoint(x: browCenter.x + eyeRadius, y: browCenter.y + tiltOffset)
        let path = UIBezierPath()
        path.move(to: browStart)
        path.addLine(to: browEnd)
        path.lineWidth = lineWidth
        return path
    }
    
    override func draw(_ rect: CGRect) {
        
        color.set()
        pathForCircleCenteredAtPoint(midpoint: skullCenter, withRadius: skullRadius).stroke()
        pathForEye(eye: .left).stroke()
        pathForEye(eye: .right).stroke()
        pathForMouth().stroke()
        pathForBrow(eye: .left).stroke()
        pathForBrow(eye: .right).stroke()
    }
 
}
