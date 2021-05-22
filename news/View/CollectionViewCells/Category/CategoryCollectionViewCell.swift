//
//  CategoryCollectionViewCell.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 12.05.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    
    var category: Category? {
        didSet {
            self.imageView.image = self.category?.image
        }
    }
    
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods

}
