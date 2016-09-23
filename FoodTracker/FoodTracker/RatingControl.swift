//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Christian Perrone on 23/09/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: Properties
    var rating = 0
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5

    //MARK: Initialization
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button + spacing
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (44 + spacing))
            button.frame = buttonFrame
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<starCount {
            
            let button  = UIButton(frame: CGRect(x : 0, y : 0, width : 44, height: 44))
            button.backgroundColor = UIColor.red
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button tapped")
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: 240, height: 44)

        }
        set {
            let buttonSize = Int(frame.size.height)
            let width = (buttonSize * starCount) + (spacing * (starCount - 1))
            intrinsicContentSize.self = CGSize(width: width, height: buttonSize)
        }
    }
}
