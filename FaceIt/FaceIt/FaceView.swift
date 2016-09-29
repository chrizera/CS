//
//  FaceView.swift
//  FaceIt
//
//  Created by Christian Perrone on 29/09/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    var scale: CGFloat = 0.90
    var mouthCurvature: Double = 1.0 // 1 = full smile, -1 = frown

    
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
    }

    private enum Eye {
        case left, right
    }
    
    private func pathForCircleCenteredAtPoint(midpoint: CGPoint, withRadius: CGFloat) -> UIBezierPath {
        
        let path =  UIBezierPath(arcCenter: midpoint, radius: withRadius, startAngle: 0.0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        
        path.lineWidth = 5.0
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
        
        return pathForCircleCenteredAtPoint(midpoint: eyeCenter, withRadius: eyeRadius)
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
        path.lineWidth = 5.0
        
        return path
    }
    
    override func draw(_ rect: CGRect) {
        
        UIColor.blue.set()
        pathForCircleCenteredAtPoint(midpoint: skullCenter, withRadius: skullRadius).stroke()
        pathForEye(eye: .left).stroke()
        pathForEye(eye: .right).stroke()
        pathForMouth().stroke()
    }
 
}
