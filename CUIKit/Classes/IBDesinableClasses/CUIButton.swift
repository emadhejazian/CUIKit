//
//  CUIButton.swift
//  CUIKit
//
//  Created by EmadHejazian on 8/23/17.
//  Copyright © 2017 Developersian. All rights reserved.
//

import UIKit

@IBDesignable
public class CUIButton: UIButton {

    var activityIndicator: UIActivityIndicatorView?
    
    override public func layoutSubviews(){
        super.layoutSubviews()
        //corner radius
        if cornerRadius == -1{
            layer.cornerRadius = frame.height / 2
        } else {
            layer.cornerRadius = cornerRadius
        }
        //tint
        tintColor = UIColor.clear
        //selected UI
        if self.isSelected{
            self.backgroundColor = isSelectedBackgroundColor
            self.layer.borderWidth = 0.0
        } else {
            self.backgroundColor = isNotSelectedBackgroundColor
            self.layer.borderWidth = isNotSelectedBorderWidth
            self.layer.borderColor = isNotSelectedBorderColor.cgColor
        }
        
        
    }
    //MARK:IBInspectables_________________________________________________________
    
    @IBInspectable var cornerRadius: CGFloat = -1{
//        willSet{
//            self.cornerRadius = frame.height / 2
//        }
        //-1 means is not set in Interface Builder
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var isSelectedBackgroundColor: UIColor = UIColor(hex:"1FB6FF") {
        didSet {
            self.backgroundColor = isSelectedBackgroundColor
        }
    }
    //
    @IBInspectable var isNotSelectedBackgroundColor: UIColor = UIColor(hex:"FFFFFF") {
        didSet {
            self.backgroundColor = isNotSelectedBackgroundColor
        }
    }
    //
    @IBInspectable var isNotSelectedBorderColor: UIColor = UIColor(hex: "D3DBE5") {
        didSet {
            
            self.layer.borderColor = isNotSelectedBorderColor.cgColor
        }
    }
    @IBInspectable var isNotSelectedBorderWidth: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = isNotSelectedBorderWidth
        }
    }
    
    func showIndicator(color:Int = 1,width:Int = 9){
        
        self.isEnabled = false
        
        activityIndicator = UIActivityIndicatorView()
        let activityIndicatorHeight = self.frame.size.height/3
        
        let activityIndicatorWidth = self.frame.size.width/10
        activityIndicator?.frame = CGRect(x: width == 9 ? activityIndicatorWidth * 9: (activityIndicatorWidth * 4) + (activityIndicatorWidth / 2 ) ,
                                          y: activityIndicatorHeight,
                                          width: activityIndicatorHeight,
                                          height: activityIndicatorHeight)
        if color == 1{
            activityIndicator?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        }else{
            activityIndicator?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        }
        self.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
    }
    
    func hideIndicator(){
        self.isEnabled = true
        activityIndicator?.removeFromSuperview()
    }
    
}



