//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

print(str) // filter

func imprimirPorConsola(_ mensaje: String) {
    print(mensaje)
}

imprimirPorConsola(str)


protocol MyProtocol {
    // Lo que sea aqui
}

class MyClass: MyProtocol {
    // Cosas aqui
}

let object: String  = "sjhfljsadhflajshdf"

extension String: MyProtocol {}

let prot: MyProtocol = "akjdghfskjdhfk"


enum Constants {
    static let houseDidChangeNotificationName = "HouseDidChange"
    static let houseKey = "HouseKey"
    static let lastHouseKey = "lastHouseKey"
}

let a = Constants.HouseDidChangeNotificationName
let b = Constants.lastHouseKey

let c = Contants()


//: [Next](@next)
