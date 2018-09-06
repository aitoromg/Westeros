/*:
 Las structs tienen DOS ventajas sobre las tuplas:
 
 - Los componentes SIEMPRE tienen nombres
 - Pueden tener metodos
 
 */

struct Complex {
    let x: Double
    let y: Double
    
    init(real: Double, imaginary: Double) {
//        x = real
//        y = imaginary
        (x, y) = (real, imaginary)
    }
    
    // En el momento en el que creas un init personalizado, el init por defecto que te genera el compilador, desaparece.
    init(real: Double) {
        self.init(real: real, imaginary: 0)
    }
    
    init(imaginary: Double) {
        self.init(real: 0, imaginary: imaginary)
    }
    
    func magnitude() -> Double {
        return ((x*x) + (y*y)).squareRoot()
    }
}

let a = Complex(real: 3, imaginary: 4)
a.magnitude()
let b = Complex(real: 4)

let c = Complex(imaginary: 6)

// Por defecto, TODO en una struct es inmutable

struct Point {
    var x: Double
    var y: Double
    
    mutating func moveTo(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

var p1 = Point(x: 2, y: 4)
p1.moveTo(x: 10, y: -5)
p1.x
p1.y


// Las structs NUNCA SE COMPARTEN (entre dos variables).
// Esto es una de las principales diferencias que tienen con las clases

// Las instancias de lcases si se comparten

var x1: Int = 32


var x2 = x1 // AQUI se hizo una copia!
x1 = 0
x2

// SPOILER: las instancias de clases si se comparten

// Las struct NO tienen HERENCIA
// Como le anadimos superpoderes a las structs? Mediante extensiones y protocols

//En el caso de las clases, mediante extensiones, HERENCia y tambien protocols.
