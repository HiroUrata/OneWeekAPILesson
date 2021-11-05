//
//  Indicator.swift
//  OneWeekAPILesson
//
//  Created by UrataHiroki on 2021/11/05.
//

import UIKit

class Indicator{
    
    public let indicatorView = UIActivityIndicatorView()
    
    public func showIndicator(targetView:UIView){
        indicatorView.center = targetView.center
        indicatorView.style = .large
        indicatorView.color = .systemRed
        
        targetView.addSubview(indicatorView)
        
        indicatorView.startAnimating()
    }
}

