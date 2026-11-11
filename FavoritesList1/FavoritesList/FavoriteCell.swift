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

    override func awakeFromNib() {
        super.awakeFromNib()
        itemImageView.layer.cornerRadius = 10
        itemImageView.clipsToBounds = true
    }

    func configure(title: String, imageName: String) {
        titleLabel.text = title
        itemImageView.image = UIImage(named: imageName)
    }
}
