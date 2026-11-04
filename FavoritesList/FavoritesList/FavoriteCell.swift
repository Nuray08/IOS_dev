//
//  FavoriteCell.swift
//  FavoritesList
//
//  Created by Nuray Nurlankyzy on 11/04/26.
//

import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        itemImageView.layer.cornerRadius = 10
        itemImageView.clipsToBounds = true
    }

    func configure(title: String, subtitle: String, imageName: String, rating: Int) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        itemImageView.image = UIImage(systemName: imageName) ?? UIImage(named: imageName)
        
        let stars = [star1, star2, star3, star4, star5]
        for (index, star) in stars.enumerated() {
            if index < rating {
                star?.image = UIImage(systemName: "star.fill")
                star?.tintColor = .systemYellow
            } else {
                star?.image = UIImage(systemName: "star")
                star?.tintColor = .systemGray3
            }
        }
    }
}
