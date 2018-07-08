//
//  CUIView.swift
//  CUIKit
//
//  Created by EmadHejazian on 8/26/17.
//  Copyright © 2017 Developersian. All rights reserved.
//

import UIKit

public class CUIView: UIView {

    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor(hex:"E0E6ED"){
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat = -1{
        didSet{
            self.layer.cornerRadius =
                (cornerRadius == -1 ) ? (self.frame.height / 2) : cornerRadius
        }
    }
    
    override public func layoutSubviews(){
        super.layoutSubviews()

        //self.clipsToBounds = clipToBounds
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius =
            (cornerRadius == -1 ) ? (self.frame.height / 2) : cornerRadius
        //Shadow
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius

    }
    
    @IBInspectable var shadowOffset:CGSize = CGSize(width: 0, height: 1){
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowColor:UIColor = UIColor(red:0, green:0, blue:0, alpha:0.1){
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity:Float = 0{
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius:CGFloat = 0{
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
}
