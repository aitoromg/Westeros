//: [Previous](@previous)

import Foundation

// Crear nuevos tipos a partir de los ya existentes

/*:
 # Nuevos tipos:
- Tuplas
- Structs
- Classes
- Enums
*/


// TUPLAS
var httpResponse = ("OK", 200)
// Las tuplas tienen tipo. En este caso es (String, Int)

dump(type(of: httpResponse))

// httpResponse = (200, "OK") ERROR!!!
httpResponse = ("BAD REQUEST", 400)


// Acceso a los componentes de una tupla: por posicion
httpResponse.0
httpResponse.1

// httpResponse.2 ERROR!


// Funciones que devuelven mas de un valor
func intDiv(_ a: Int, _ b: Int) -> (Int, Int) {
    return ( (a / b), (a % b) )
}

intDiv(3, 2)

// Crear un servidor web
typealias HTTPStatus = (code: Int, text: String)
typealias HTTPRequest = String // De momento
typealias HTTPResponse = (body: String, status: HTTPStatus)

func httpServer(request: HTTPRequest) -> HTTPResponse {
    // Aqui seria el codigo de verdad
    // ...
    return ("It worked!", (200, "OK"))
}

let response = httpServer(request: "index.html")
dump(response)


// PATTERN MATCHING
//let result = intDiv(5, 2)
//let cociente = result.0
//let resto = result.1

let (cociente, resto) = intDiv(5, 2)
dump(cociente)
dump(resto)

let (_, status) = httpServer(request: "index.html")
dump(status)

let (code, _) = status
dump(code)

// Tuplas de N elementos
// a la tupla de n elementos se le llama n-tupla
(3, 4, "abc") // 3-tupla
(3, 4) // 2-tupla
(3) //1-tupla???? NO!!!! Es el elemento
() // 0-tupla????? SI! Significa la NADA. Como Void

func f(a: Int) {
    print(a)
}

func h(a: Int) -> () {
    print(a)
}

f(a: 7)
h(a: 7)

//let status = result.1









//: [Next](@next)
