
//Step 1
let firstName: String = "Nuray"
let lastName: String = "Nurlankyzy"
let age: Int = 20
let birthYear: Int = 2006
let isStudent: Bool = true
let height: Double = 1.67
let bloodType: String = "I+🩸"
let hometown: String = "Almaty🙌🏿"

let currentYear: Int = 2026
let currentAge: Int = currentYear - birthYear

//Step 2
let hobby = "🫪learning languages,singing,reading comics,and watching US TV shows"
let numberOfHobbies: Int = 4
let favoriteNumber: Int = 8
let isHobbyCreative: Bool = true
let lastBookRead: String = "📜The Seven Dials Mystery by Agatha Christie"
let languageLearning: String = "Korean🇰🇷"

let 🎯futureGoals: String = "I want to become a professional software developer"

//Step 3
let lifeStory = """
My name is \(firstName) \(lastName). I am \(currentAge) years old, born in \(birthYear).
I live in \(hometown). \(isStudent ? "I am currently a student." : "I am not a student.")
My height is \(height)m and my blood type is \(bloodType).

My hobbies include \(hobby).
I have \(numberOfHobbies) hobbies in total. My hobbies are pretty \(isHobbyCreative ? "creative" : "not creative.") i think.
Right now, I am studying \(languageLearning), and the last book I read was \(lastBookRead).
My favorite number is \(favoriteNumber).

In the future, \(🎯futureGoals).
"""


print(lifeStory)



