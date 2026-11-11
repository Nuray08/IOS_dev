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
    let description: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let items: [FavoriteItem] = [
        FavoriteItem(
            title: "Mouse",
            subtitle: "2021 • Детективный триллер",
            imageName: "film1",
            rating: 5,
            description: "Сюжет разворачивается вокруг загадочного серийного убийцы, чья жестокость ставит в тупик полицию и общество. Молодой участковый сталкивается с событиями, которые навсегда меняют его привычный мир. Напряжение держится на каждом повороте истории благодаря неожиданным раскрытиям."
        ),
        FavoriteItem(
            title: "Teach You a Lesson",
            subtitle: "2026 • Драма",
            imageName: "film2",
            rating: 5,
            description: "История поднимает острые вопросы ответственности, справедливости и границ допустимого в школе. Героям приходится принимать сложные решения, когда прежние методы перестают работать. Сериал заставляет задуматься о последствиях каждого поступка."
        ),
        FavoriteItem(
            title: "Love in Disguise",
            subtitle: "2026 • Романтика",
            imageName: "film3",
            rating: 4,
            description: "Лёгкая и тёплая романтическая история начинается с недоразумения и скрытой личности главного героя. Постепенно за внешней маской открываются искренние чувства и настоящая поддержка. Проект хорошо сочетает юмор, нежность и уютную атмосферу."
        ),
        FavoriteItem(
            title: "When Life Gives You Tangerines",
            subtitle: "2025 • Мелодрама",
            imageName: "film4",
            rating: 5,
            description: "Трогательная драма о взрослении, стойкости и любви, пронесённой через десятилетия. Действие переносит зрителей в живописные места и эпоху перемен, где важна каждая деталь. История цепляет своей жизненностью и глубокими эмоциями."
        ),
        FavoriteItem(
            title: "Doctor X: Mafia in White",
            subtitle: "2026 • Медицинская драма",
            imageName: "film5",
            rating: 5,
            description: "Блестящий специалист оказывается втянутым в опасные игры внутри системы, где власть и деньги часто важнее правил. Каждая операция становится проверкой характера и профессиональных принципов. Динамичный сюжет не отпускает до самого финала."
        ),
        FavoriteItem(
            title: "Reply 1988",
            subtitle: "2015 • Комедия, семейный",
            imageName: "film6",
            rating: 5,
            description: "Душевный рассказ о жизни пяти семей и друзей из одного квартала в Сеуле. В центре внимания — дружба, первая любовь, семейные заботы и тепло повседневных моментов. Сериал создаёт редкое чувство ностальгии даже у тех, кто не жил в то время."
        ),
        FavoriteItem(
            title: "Weightlifting Fairy Kim Bok-joo",
            subtitle: "2016 • Романтика, спорт",
            imageName: "film7",
            rating: 5,
            description: "Вдохновляющая история о молодой тяжелоатлетке, которая стремится к мечтам и учится слышать себя. Рядом оказываются верные друзья и поддержка, помогающая преодолеть сомнения. Лёгкий тон и искренность делают просмотр по-настоящему светлым."
        ),
        FavoriteItem(
            title: "Weak Hero Class 1",
            subtitle: "2022 • Экшн, школьная драма",
            imageName: "film8",
            rating: 5,
            description: "Тихий и сообразительный ученик противостоит школьному произволу с помощью логики и расчёта. Вместе с новыми союзниками он сталкивается с жестокими испытаниями на прочность. История выделяется реализмом, темпом и сильными персонажами."
        ),
        FavoriteItem(
            title: "Dr. Romantic",
            subtitle: "2016–2023 • Медицинская драма",
            imageName: "film9",
            rating: 5,
            description: "Талантливый хирург работает в скромной больнице вдали от столичной суеты и учит молодых врачей главному в профессии. Каждый эпизод показывает цену человеческой жизни и важность командной работы. Сериал сочетает напряжённую медицину и сильную мораль."
        ),
        FavoriteItem(
            title: "Historical mystery drama",
            subtitle: "Исторический детектив",
            imageName: "film10",
            rating: 4,
            description: "Расследование запутанного дела разворачивается на фоне дворцовых интриг и строгих правил прошлого. Главным героям приходится искать улики там, где любая ошибка стоит дорого. Атмосфера эпохи и загадки удерживают интерес от начала до конца."
        ),

        
        FavoriteItem(
            title: "The Apothecary Diaries",
            subtitle: "2023–2025 • Исторический детектив",
            imageName: "anime1",
            rating: 5,
            description: "Юная травница с острым умом и страстью к ядам и лекарствам попадает во внутренний дворец. Наблюдательность и знание химии помогают ей разгадывать сложные тайны и спасать жизни. Аниме сочетает детективную логику, юмор и выразительный стиль."
        ),
        FavoriteItem(
            title: "Attack on Titan",
            subtitle: "2013 • Тёмное фэнтези, экшн",
            imageName: "anime2",
            rating: 5,
            description: "Остатки человечества живут за высокими стенами, пытаясь укрыться от гигантских существ. Когда спокойствие рушится, герои отправляются в опасную борьбу за правду о своём мире. Сюжет поражает масштабом, драмой и неожиданными поворотами."
        ),
        FavoriteItem(
            title: "Howl's Moving Castle",
            subtitle: "2004 • Фэнтези, приключения",
            imageName: "anime3",
            rating: 5,
            description: "После загадочного проклятия девушка отправляется в путь и находит приют в шагающем замке эксцентричного волшебника. На фоне войны и магии раскрываются темы свободы, смелости и принятия себя. Фильм дарит неповторимое волшебство и уют."
        ),
        FavoriteItem(
            title: "Yona of the Dawn",
            subtitle: "2009 • Приключения, романтика",
            imageName: "anime4",
            rating: 5,
            description: "Беззаботная принцесса вынуждена бежать из дворца после предательства и заново узнать своё королевство. Вместе с преданным телохранителем она находит союзников и обретает внутреннюю силу. История показывает путь взросления от хрупкости к решимости."
        ),
        FavoriteItem(
            title: "S · A: Special A",
            subtitle: "2003 • Школьная романтика, комедия",
            imageName: "anime5",
            rating: 4,
            description: "Соперничество лучших учеников элитной школы постепенно перерастает в искреннюю привязанность. Яркие персонажи и быстрый комедийный ритм создают бодрое настроение. Это лёгкая история о стремлении к победе и важных чувствах."
        ),
        FavoriteItem(
            title: "Class President is a Maid!",
            subtitle: "2010 • Романтика, комедия",
            imageName: "anime6",
            rating: 5,
            description: "Строгая президент студсовета тайно подрабатывает в мейд-кафе, чтобы помочь семье. Когда её секрет узнаёт самый популярный парень школы, начинаются забавные и тёплые перемены. Аниме запоминается харизмой героев и отличной динамикой."
        ),
        FavoriteItem(
            title: "Avatar: The Last Airbender",
            subtitle: "2005 • Приключения, фэнтези",
            imageName: "anime7",
            rating: 5,
            description: "Юный маг воздуха, пробудившийся после долгого сна, должен освоить все стихии и остановить затяжную войну. В путешествии к нему присоединяются верные друзья, каждый со своей историей и ролью. Сериал глубоко раскрывает темы мира, долга и прощения."
        ),
        FavoriteItem(
            title: "Spirited Away",
            subtitle: "2001 • Фэнтези, приключения",
            imageName: "anime8",
            rating: 5,
            description: "Маленькая девочка оказывается в мире духов и богов, где ей предстоит устроиться на работу в купальни, чтобы спасти родителей. Через трудности и новые знакомства она учится смелости и самостоятельности. Картина остаётся эталоном анимационного приключения."
        ),
        FavoriteItem(
            title: "Kamisama Kiss",
            subtitle: "Романтика, сверхъестественное",
            imageName: "anime9",
            rating: 5,
            description: "Оставшись без крыши над головой, девушка неожиданно становится местным божеством в старинном храме. Её новым фамильяром оказывается своенравный лис-ёкай, с которым связано множество тайн. Тёплая романтика и фольклорные мотивы делают историю особенной."
        ),
        FavoriteItem(
            title: "Frieren: Beyond Journey's End",
            subtitle: "2023 • Фэнтези, приключения",
            imageName: "anime10",
            rating: 5,
            description: "Эльфийка-маг из легендарного отряда героев отправляется в новое путешествие, чтобы лучше понять людей и цену времени. Потеря близких заставляет её по-новому взглянуть на прошлые годы и мимолётные встречи. Спокойное, глубокое и визуально тонкое произведение."
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 90
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.configure(title: item.title, imageName: item.imageName)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetail",
              let detailVC = segue.destination as? DetailViewController,
              let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        detailVC.item = items[indexPath.row]
    }
}
