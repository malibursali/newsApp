//
//  NewsTableViewCell.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 7.05.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var news: News? {
        didSet {
            self.titleLabel.text = news?.title
            self.descriptionLabel.text = news?.description
            
            if let imageUrl = news?.imageUrl {
                self.newsImageView.kf.setImage(with: URL(string: imageUrl))
            } else {
                self.newsImageView.image = nil
            }
        }
    }
    
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            self.backgroundColor = .black
            self.titleLabel.textColor = .white
            self.descriptionLabel.textColor = .white
        } else {
            self.backgroundColor = .white
            self.titleLabel.textColor = .black
            self.descriptionLabel.textColor = .black
        }
    }
}
