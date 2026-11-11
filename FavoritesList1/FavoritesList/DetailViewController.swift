//
//  DetailViewController.swift
//  FavoritesList
//
//  Created by Nuray Nurlankyzy on 11/11/26.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!

    var item: FavoriteItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        guard let item = item else { return }

        title = item.title
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        descriptionLabel.text = item.description

        detailImageView.image = UIImage(named: item.imageName)
        detailImageView.layer.cornerRadius = 14
        detailImageView.clipsToBounds = true

        let stars = [star1, star2, star3, star4, star5]
        for (index, star) in stars.enumerated() {
            if index < item.rating {
                star?.image = UIImage(systemName: "star.fill")
                star?.tintColor = .systemYellow
            } else {
                star?.image = UIImage(systemName: "star")
                star?.tintColor = .systemGray3
            }
        }
    }
}
