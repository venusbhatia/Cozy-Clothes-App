import Foundation
import FirebaseAnalytics
import FirebaseInstallations
import FirebaseCore

struct CategoryModel: Identifiable {
    let id = UUID()
    let men: [Category]
    let women: [Category]
    let kids: [Category]
}

struct Category {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageUrl: String
}

extension CategoryModel {
    static func all() -> CategoryModel {
        return CategoryModel(
            men: [
                Category(title: "New Arrival for Men", subtitle: "", imageUrl: "men1"),
                Category(title: "Men's Wear", subtitle: "", imageUrl: "men2"),
                Category(title: "Shoes for Men", subtitle: "", imageUrl: "men3"),
                Category(title: "Accesories for Men", subtitle: "", imageUrl: "men4")
            ],
            women: [
                Category(title: "New Arrival for Women", subtitle: "", imageUrl: "cat1"),
                Category(title: "Clothes for Women", subtitle: "", imageUrl: "cat2"),
                Category(title: "Shoes for Women", subtitle: "", imageUrl: "cat3"),
                Category(title: "Accesories for Women", subtitle: "", imageUrl: "cat4")
            ],
            kids: [
                Category(title: "New Arrival for Kids", subtitle: "", imageUrl: "kid1"),
                Category(title: "Kid's Wear", subtitle: "", imageUrl: "kid2"),
                Category(title: "Shoes for Kids", subtitle: "", imageUrl: "kid3"),
                Category(title: "Accesories for Kids", subtitle: "", imageUrl: "kid4")
            ]
        )
    }
}
