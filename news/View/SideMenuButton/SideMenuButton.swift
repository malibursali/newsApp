//
//  SideMenuButton.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 16.05.2021.
//

import UIKit

protocol SideMenuButtonDelegate {
    func buttonDidTapped(_ type: SideMenuButtonType)
}

class SideMenuButton: UIView, NibInitializable {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var nibName: String = "SideMenuButton"
    var buttonType: SideMenuButtonType?
    var delegate: SideMenuButtonDelegate?
    
    
    // MARK: - Initializers
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
    }
    
    private func postInitialize(_ view: UIView) {
        self.addTapGesture()
    }
    
    
    // MARK: - Setup
    
    func configure(_ icon: UIImage?, _ title: String, _ type: SideMenuButtonType) {
        self.iconImageView.image = icon
        self.titleLabel.text = title
        self.buttonType = type
    }
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapped))
        
        self.addGestureRecognizer(tapGesture)
    }
    
    
    // MARK: - Actions
    
    @objc func didTapped() {
        if let type = self.buttonType {
            self.delegate?.buttonDidTapped(type)
        }
    }
}
