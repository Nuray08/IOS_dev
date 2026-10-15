//
//  ViewController.swift
//  Foodie
//
//  Created by Nuray Nurlankyzy on 10/15/26.
//

import UIKit

struct Favorite {
    let imageName: String
    let title: String
    let description: String
}

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var randomButton: UIButton!
    
    let favorites: [Favorite] = [
        Favorite(imageName: "Et_fav1", title: "Et (Beshbarmak)", description: "A national Kazakh dish made with boiled meat, kazy (horse meat sausage) and thin pieces of dough. Some people call it beshbarmak."),
        Favorite(imageName: "Plov_fav2", title: "Plov", description: "A rice dish cooked with meat, carrots and onions. It is popular in Kazakhstan and is often served at big family meals."),
        Favorite(imageName: "Kimpab_fav3", title: "Kimbap", description: "A Korean roll made of rice, vegetables and meat or egg, wrapped in seaweed. It is easy to take with you, so people often eat it on picnics"),
        Favorite(imageName: "Tteokbokki_fav4", title: "Tteokbokki", description: "Soft Korean rice cakes in a sweet and spicy red sauce. It is a very popular street food in Korea."),
        Favorite(imageName: "BuldakRamen_fav5", title: "Buldak Carbonara Ramen", description: "Very spicy Korean instant noodles with a creamy carbonara sauce. It tastes hot and rich at the same time."),
        Favorite(imageName: "NauryzKozhe_fav6", title: "Nauryz Kozhe(mom's)", description: "A traditional Kazakh soup made in March for Nauryz, the New Year. It is cooked with seven ingredients and means health and a good new year"),
        Favorite(imageName: "PickledGinger_fav7", title: "Pickled Ginger", description: "Thin slices of ginger in a sweet and sour liquid. People usually eat it with sushi to clean the taste in their mouth."),
        Favorite(imageName: "Ganfan_fav8", title: "Ganfan", description: "A plate of rice with meat and vegetables in a thick sauce. It is filling, tasty and easy to eat."),
        Favorite(imageName: "Miyeokguk_fav9", title: "Miyeokguk", description: "A Korean seaweed soup, often made with beef. Koreans traditionally eat it on their birthday and it is also good for your health."),
        Favorite(imageName: "Popeyes_fav10", title: "Popeyes", description: "Crispy fried chicken from the fast food chain Popeyes. It is juicy inside and has a spicy, crunchy coating.")
    ]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(red: 1.0, green: 0.96, blue: 0.9, alpha: 1.0)
        
        randomButton.layer.cornerRadius = 25
        
        show(favorites[currentIndex])
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var newIndex = Int.random(in: 0..<favorites.count)
        while newIndex == currentIndex {
            newIndex = Int.random(in: 0..<favorites.count)
        }
        currentIndex = newIndex
        show(favorites[newIndex])
    }
    
    func show(_ favorite: Favorite) {
        UIView.transition(with: view, duration: 0.35, options: .transitionCrossDissolve) {
            self.imageView.image = UIImage(named: favorite.imageName)
            self.titleLabel.text = favorite.title
            self.descriptionLabel.text = favorite.description
        }
    }
}
