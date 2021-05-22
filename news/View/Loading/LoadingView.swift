//
//  LoadingView.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 12.05.2021.
//

import UIKit

class LoadingView: UIView {
    static let shared = LoadingView()
    
    var containerView = UIView()
    var activityIndicatorView = UIActivityIndicatorView()
    
    func show() {
        self.frame = UIScreen.main.bounds
        self.backgroundColor = .clear
        
        self.containerView.frame.size = CGSize(width: self.frame.size.width*0.4, height: self.frame.size.width*0.4)
        self.containerView.center = self.center
        self.containerView.backgroundColor = .darkGray
        self.containerView.layer.cornerRadius = 10
        
        self.activityIndicatorView.frame = self.containerView.bounds
        self.activityIndicatorView.style = .large
        self.activityIndicatorView.color = .white
        self.activityIndicatorView.startAnimating()
        
        self.containerView.addSubview(self.activityIndicatorView)
        self.addSubview(self.containerView)
        
        rootController?.view.addSubview(self)
    }
    
    func hide() {
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.removeFromSuperview()
        self.containerView.removeFromSuperview()
        self.removeFromSuperview()
    }
}
