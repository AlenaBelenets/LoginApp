//
//  User.swift
//  LoginApp
//
//  Created by Alena Belenets on 05.07.2022.
//

struct User {
    let login: String
    let userPassword: String
    let person: Person

    static func getUserData() -> User  {
        User(
            login: "User",
            userPassword: "Password",
            person: Person.getPersonData()
        )
    }
}

struct Person {
    let name: String
    let lastName: String
    let education: String
    let activity: String
    let hobby: String
    let image: String


    var fullName: String {
        "\(name) \(lastName)"
    }

    static func getPersonData() -> Person {
        Person(
            name: "Alena",
            lastName: "Belenets",
            education: "Образование - экология и природопользование",
            activity: "С недавнего времени полюбила бег",
            hobby: "Мои увлечения это чтение и путешествия",
            image: "Image")
    }
}
