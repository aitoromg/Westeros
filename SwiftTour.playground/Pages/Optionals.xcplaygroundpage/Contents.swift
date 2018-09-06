//: [Previous](@previous)

import Foundation

// Opcionales: son una especia de caja

var name: String?

name = "Jon Snow"

//name = nil

// Tenemos que tener MUCHO cuidado a la hora de leer un opcional
// Si la caja tiene valor, perfecto. Todo funciona
// Si la caja esta vacia, crash

// Podemos abrir la caja de dos maneras
// 1. Explicitamente (a.k.a "por mis cojones")
// 2. Con modales

// 1: utilizando !
print(name!)

// 2: con modales. Dos sub-maneras de desempaquetarlo
// if let
if let name = name {
    print(name)
}

// Aqui fuera, name sigue siendo String?

// guard
enum MyError: Error {
    case terribleError
}
guard let name = name else {
    // Haces otra cosa, en caso de que haya nil
    return MyError.terribleError
}

// Aqui fuera, name si es de tipo string.
print(name)
//: [Next](@next)
