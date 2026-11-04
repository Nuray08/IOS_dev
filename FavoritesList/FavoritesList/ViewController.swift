//
//  ViewController.swift
//  FavoritesList
//
//  Created by Nuray Nurlankyzy on 11/04/26.
//

import UIKit

struct FavoriteItem {
    let title: String
    let subtitle: String
    let imageName: String
    let rating: Int
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let items: [FavoriteItem] = [
        // Первые 10: film1 - film10
        FavoriteItem(title: "Mouse", subtitle: "2021 • Детективный триллер", imageName: "film1", rating: 5),
        FavoriteItem(title: "Teach You a Lesson", subtitle: "2026 • Драма", imageName: "film2", rating: 5),
        FavoriteItem(title: "Love in Disguise", subtitle: "2026 • Романтика", imageName: "film3", rating: 4),
        FavoriteItem(title: "When Life Gives You Tangerines", subtitle: "2025 • Мелодрама", imageName: "film4", rating: 5),
        FavoriteItem(title: "Doctor X: Mafia in White", subtitle: "2026 • Медицинская драма", imageName: "film5", rating: 5),
        FavoriteItem(title: "Reply 1988", subtitle: "2015 • Комедия, семейный", imageName: "film6", rating: 5),
        FavoriteItem(title: "Weightlifting Fairy Kim Bok-joo", subtitle: "2016 • Романтика, спорт", imageName: "film7", rating: 5),
        FavoriteItem(title: "Weak Hero Class 1", subtitle: "2022 • Экшн, школьная драма", imageName: "film8", rating: 5),
        FavoriteItem(title: "Dr. Romantic", subtitle: "2016–2023 • Медицинская драма", imageName: "film9", rating: 5),
        FavoriteItem(title: "Historical mystery drama", subtitle: "Исторический детектив", imageName: "film10", rating: 4),

        // Следующие 10: anime1 - anime10
        FavoriteItem(title: "The Apothecary Diaries", subtitle: "2023–2025 • Исторический детектив", imageName: "anime1", rating: 5),
        FavoriteItem(title: "Attack on Titan", subtitle: "2013 • Тёмное фэнтези, экшн", imageName: "anime2", rating: 5),
        FavoriteItem(title: "Howl's Moving Castle", subtitle: "2004 • Фэнтези, приключения", imageName: "anime3", rating: 5),
        FavoriteItem(title: "Yona of the Dawn", subtitle: "2009 • Приключения, романтика", imageName: "anime4", rating: 5),
        FavoriteItem(title: "S · A: Special A", subtitle: "2003 • Школьная романтика, комедия", imageName: "anime5", rating: 4),
        FavoriteItem(title: "Class President is a Maid!", subtitle: "2010 • Романтика, комедия", imageName: "anime6", rating: 5),
        FavoriteItem(title: "Avatar: The Last Airbender", subtitle: "2005 • Приключения, фэнтези", imageName: "anime7", rating: 5),
        FavoriteItem(title: "Spirited Away", subtitle: "2001 • Фэнтези, приключения", imageName: "anime8", rating: 5),
        FavoriteItem(title: "Kamisama Kiss", subtitle: "Романтика, сверхъестественное", imageName: "anime9", rating: 5),
        FavoriteItem(title: "Frieren: Beyond Journey's End", subtitle: "2023 • Фэнтези, приключения", imageName: "anime10", rating: 5)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 110
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.configure(title: item.title, subtitle: item.subtitle, imageName: item.imageName, rating: item.rating)
        return cell
    }
}
