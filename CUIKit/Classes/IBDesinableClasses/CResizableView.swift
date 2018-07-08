//
//  CResizableView.swift
//  CUIKit
//
//  Created by EmadHejazian on 8/26/17.
//  Copyright © 2017 Developersian. All rights reserved.
//

import UIKit

public class CResizableView: CUIView {
    
    //var didMoveToSuperviewCount = 0
    @IBOutlet public weak var parentView: UIView!
    @IBOutlet public weak var internalLabel: UILabel!
    
    //Margin the view from own Parent View
    @IBInspectable var upMargin:CGFloat = 0
    @IBInspectable var rightMargin:CGFloat = 0
    @IBInspectable var downMargin:CGFloat = 0
    @IBInspectable var leftMargin:CGFloat = 0
   
    //Padding the view from Internal Label
    @IBInspectable var upPadding:CGFloat = 0
    @IBInspectable var rightPadding:CGFloat = 0
    @IBInspectable var downPadding:CGFloat = 0
    @IBInspectable var leftPadding:CGFloat = 0
    
    override public func layoutSubviews(){
        
        self.updateSize()
        super.layoutSubviews()
    }
    
    override public func didMoveToSuperview() {
        self.updateSize()
        
        super.didMoveToSuperview()
    }
    
    public func updateSize(){
        if self.internalLabel == nil {return}
        if (self.internalLabel.text?.isEmpty)! {return}
        
        let widthOffset:CGFloat = leftPadding + rightPadding
        let heightOffset:CGFloat = upPadding + downPadding
        
        let textSize = sizeForString(label: self.internalLabel)
        //Resize
        self.frame = CGRect(x: leftMargin,
                            y: self.frame.origin.y + upMargin,
                            width: textSize.width + widthOffset,
                            height: self.frame.height + heightOffset)
        self.internalLabel.frame = CGRect(x: 0, y: 0, width: textSize.width, height: textSize.height)
        
        //Centralize
        if self.parentView != nil{
            self.center.x = (self.parentView.frame.width / 2) + (leftMargin - rightMargin)
        } else {
            print("error : parent view in CResizableView is nill")
        }
        self.internalLabel.center.x = (self.frame.width / 2 ) + (leftPadding - rightPadding)
        self.internalLabel.center.y = (self.frame.height / 2 ) + (upPadding - downPadding)
        
    }
    
    func sizeForString(label:UILabel) -> CGSize{
        let size = label.text?.size(attributes: [NSFontAttributeName: label.font])
        return CGSize(
            width: ceil(size!.width),
            height: ceil(size!.height))
    }
    
}
