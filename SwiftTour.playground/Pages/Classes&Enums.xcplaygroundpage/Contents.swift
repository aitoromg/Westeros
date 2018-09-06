//: [Previous](@previous)

import UIKit

// Programa que representa Libros
// No hace falta heredar de NSObject
class AnonymousBook {
    let title: String
    
    // Swift tiene panico a nil
    // Si no le damos un valor por defecto, tienes que crear un init y darle el valor ahi dentro.
    init(title: String) {
        self.title = title
    }
}

// Herencia
// En swift, una clase puede tener UNA o CERO superclases

class Book: AnonymousBook {
    let authors: [String]
    
    // Inicializador designado. SOLO se puede tener un init designado dentro de la clase.
    // No se puede tener un init designado dentro de una extension
    init(title: String, authors: [String]) {
        // Lo primero que hay que hacer, es inicializar TUS propiedades
        self.authors = authors

        // Una vez que limpias tu propio desorden, llamas a super
        super.init(title: title)
    }
}

extension Book {
    convenience init(title: String, author: String) {
        // SIEMPRE: hay que llamar al self.init
        // Los inits de conveniencia siempre tienen que llamar al designado
        self.init(title: title, authors: [author])
    }
}

// Si es una subclase, el init designado llama a super.init
// Un init de conveniencia siempre llama a self.init

// BUENAS PRACTICAS: marcar SIEMPRE las clases como finales. SI luego tienes que extender, se lo quitas
// Las clases finales son aquellas de las que no se puede heredar, es decir, no puede tener subclases.

final class BookCharacter {
    let name: String
    let book: Book
    
    init(name: String, book: Book) {
        self.name = name
        self.book = book
    }
}


// Como las structs, las clases tambien implementar protocols

extension BookCharacter: CustomStringConvertible {
    var description: String {
        return "<\(type(of: self))>: \(name). Appears in \(book.title)"
    }
}

let c = BookCharacter(name: "Jon Snow", book: Book(title: "Game of Thrones", author: "GRR"))

print(c)


// Sobreescritura de metodos
// Override

class MyView: UIView {
    override func draw(_ rect: CGRect) {
        // HAgo lo mio ...
    }
}

class MyClass {
    var x1: Int
    
    init(x: Int) {
        x1 = x
    }
}

let object = MyClass(x: 8)

let aux = object

object.x1
aux.x1

object.x1 = 42
object.x1
aux.x1

// Mi preferida: Las enums
enum Genre: String  {
    case terror = "Pelicula de terror"
    case sciFi = "Pelicula de ciencia ficcion"
}

let genre: Genre = .sciFi

genre.rawValue
