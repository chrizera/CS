//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Christian Perrone on 23/09/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let button  = UIButton(frame: CGRect(x : 0, y : 0, width : 44, height: 44))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
        addSubview(button)
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button tapped")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 240, height: 44)
    }

}
