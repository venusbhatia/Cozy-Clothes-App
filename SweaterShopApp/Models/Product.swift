import Foundation
import FirebaseAnalytics
import FirebaseInstallations
import FirebaseCore

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var description: String
}

var product1 = Product(name: "PinkSweater", image: "sweater9", price: 2899, description: " The perfect addition to your wardrobe, this sweater features a flattering cut and versatile design that makes it easy to pair with any outfit. ")

var product2 = Product(name: "BlueJeans", image: "jeans1", price: 1499, description: " Made with high-quality materials and a timeless design, these jeans are the perfect choice for any casual occasion. ")

var product3 = Product(name: "BlackJeans", image: "jeans2", price: 1499, description: " Sleek and stylish, these black jeans are perfect for any occasion. It will hug your curves in all the right places.")

var product4 = Product(name: "WhiteJeans", image: "jeans3", price: 1499, description: " Get ready to turn heads with these stunning white jeans, crafted with a flattering fit and durable materials that will last you for seasons to come. ")

var product5 = Product(name: "OrangeSweater", image: "sweater1", price: 1549, description: " Stay cozy and stylish this season with our vibrant orange sweater, perfect for adding a pop of color to any outfit. ")

var product6 = Product(name: "RedwineSweater", image: "sweater2", price: 1899, description: " Sip on sophistication with our rich red wine sweater, featuring a cozy knit design and flattering fit. ")

var product7 = Product(name: "SandSweater", image: "sweater3", price: 1799, description: " Embrace the warmth of the desert with our sand-colored sweater. ")

var product8 = Product(name: "SeaSweater", image: "sweater4", price: 1950, description: " Make a splash with our sea-inspired sweater, featuring a beautiful blue-green hue and a comfortable, relaxed fit. ")

var product9 = Product(name: "CreamSweater", image: "sweater5", price: 9990, description: " Elevate your wardrobe with our elegant cream sweater, crafted from high-quality materials for a luxurious feel. ")

var product10 = Product(name: "BeigeSweater", image: "sweater6", price: 2650, description: " Stay chic and comfortable with our versatile beige sweater, perfect for dressing up or down and layering with your favorite pieces. ")

var product11 = Product(name: "GreySweater", image: "sweater7", price: 2499, description: " Keep it classic with our timeless grey sweater, featuring a simple yet stylish design that will never go out of fashion. ")

var product12 = Product(name: "MinkSweater", image: "sweater8", price: 1899, description: " Indulge in luxury with our sumptuous mink sweater, made from premium materials that are soft to the touch and feel really comfy wearing. ")

var productList = [product1, product2, product3, product4, product5, product6, product7, product8, product9, product10, product11, product12]


//var orangeSweater = Product(name: "Orange sweater", image: "sweater1", price: 1549, description: " Stay cozy and stylish this season with our vibrant orange sweater, perfect for adding a pop of color to any outfit. ")
//
//var redWineSweater = Product(name: "Red wine sweater", image: "sweater2", price: 1899, description: " Sip on sophistication with our rich red wine sweater, featuring a cozy knit design and flattering fit. ")
//
//var sandSweater = Product(name: "Sand sweater", image: "sweater3", price: 1799, description: " Embrace the warmth of the desert with our sand-colored sweater. ")
//
//var seaSweater = Product(name: "Sea sweater", image: "sweater4", price: 1950, description: " Make a splash with our sea-inspired sweater, featuring a beautiful blue-green hue and a comfortable, relaxed fit.")
//
//var creamSweater = Product(name: "Cream sweater", image: "sweater5", price: 9990, description: " Elevate your wardrobe with our elegant cream sweater, crafted from high-quality materials for a luxurious feel. ")
//
//var beigeSweater = Product(name: "Beige sweater", image: "sweater6", price: 2650, description: " Stay chic and comfortable with our versatile beige sweater, perfect for dressing up or down and layering with your favorite pieces. ")
//
//var greySweater = Product(name: "Grey sweater", image: "sweater7", price: 2499, description: " Keep it classic with our timeless grey sweater, featuring a simple yet stylish design that will never go out of fashion. ")
//
//var minkSweater = Product(name: "Mink sweater", image: "sweater8", price: 1899, description: " Indulge in luxury with our sumptuous mink sweater, made from premium materials that are soft to the touch and feel really comfy wearing. ")
//
//var pinkSweater = Product(name: "Pink sweater", image: "sweater9", price: 2899, description: " The perfect addition to your wardrobe, this sweater features a flattering cut and versatile design that makes it easy to pair with any outfit.")
//
//var bluejeans = Product(name: "Blue Jeans", image: "jeans1", price: 1499, description: " Made with high-quality materials and a timeless design, these jeans are the perfect choice for any casual occasion.")
//
//var blackjeans = Product(name: "Black Jeans", image: "jeans2", price: 1499, description: " Sleek and stylish, these black jeans are perfect for any occasion. It will hug your curves in all the right places.")
//
//var whitejeans = Product(name: "White Jeans", image: "jeans3", price: 1499, description: "Get ready to turn heads with these stunning white jeans, crafted with a flattering fit and durable materials that will last you for seasons to come.")
//
//var productList = [pinkSweater, bluejeans, blackjeans, whitejeans, orangeSweater, redWineSweater, sandSweater, seaSweater, creamSweater, beigeSweater, greySweater, minkSweater]
