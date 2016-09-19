//: Playground - noun: a place where people can play

import UIKit

enum TextAlignment: Int {
    case Left = 20
    case Right = 30
    case Center = 40
    case Justify = 50
}

var alignment: TextAlignment = TextAlignment.Left
var alignment2 = TextAlignment.Left
alignment = .Right

if alignment == .Right {
    //print("Right here where we wanted to be")
}

switch alignment {
case .Right:
    print("Right")
case .Left:
    print("Left")
case .Center:
    print("Center")
case .Justify:
    print("Nada")
}

/*print(alignment.rawValue)
print(TextAlignment.Left.rawValue)
print(TextAlignment.Right.rawValue)
TextAlignment.Center.rawValue
TextAlignment.Justify.rawValue*/

let myRawValue = 40
if let myAlignment = TextAlignment(rawValue: myRawValue){
    print("Converteu")
}
else{
    print("Não converteu")
}

enum ProgrammingLang: String{
    case Swift
    case ObjectiveC = "Objective C"
    case C
    case Cpp = "C++"
    case Java
}
let minhaLing = ProgrammingLang.Java
let minhaOutraLing = ProgrammingLang.init(rawValue: "Objective C")

enum Lampada{
    case On, Off
    
    func tempLampada(tempAmbiente temp: Double) -> Double{
        switch self{
        case .On:
            return temp + 150.0
        case .Off:
            return temp
        }
    }
    mutating func toggle(){
        switch self{
        case .On:
            self = .Off
        case.Off:
            self = .On
        }
    }
}

var lampada = Lampada.On
let temperatura = 84.0

var tempDaLampada = lampada.tempLampada(tempAmbiente: temperatura)
lampada = Lampada.Off
tempDaLampada = lampada.tempLampada(tempAmbiente: temperatura)
lampada.toggle()
lampada.toggle()

enum Formas{
    case Quadrado(Double)
    case Retangulo(altura: Double, largura: Double)
    case Ponto
    case Triangulo(altura: Double, base: Double)
    
    func area() -> Double{
        switch self{
        case let .Quadrado(lado):
            return lado*lado
        case let .Retangulo(altura, base):
            return altura*base
        case .Ponto:
            return 0
        case let .Triangulo(altura: altura, base: base):
            return (base*altura)/2
        }
    }
    func perimetro() -> Double{
        switch self{
        
        case .Ponto:
        return 0
        case let .Quadrado(lado):
        return 4*lado
        case let .Retangulo(base, altura):
        return (2*base + 2*altura)
        case let .Triangulo(_, _):
            return 3
        }
    }
}
var medidaQuadrado = Formas.Quadrado(15.5)
var medidaRetangulo = Formas.Retangulo(altura: 10.2, largura: 3.3)
medidaQuadrado.area()
medidaRetangulo.area()
var medidaPonto = Formas.Ponto
medidaPonto.area()

enum FamilyTree{
    case SemPais
    indirect case umPai(nome: String, ancestrais: FamilyTree)
    indirect case doisPais(nomePai: String, ancestralPai: FamilyTree, nomeMae: String, ancestralMae: FamilyTree)
}
var Fred = FamilyTree.doisPais(nomePai: "Papai", ancestralPai: .SemPais, nomeMae: "Mamae", ancestralMae: .umPai(nome: "Vagner", ancestrais: .SemPais))

var perimetro = Formas.Quadrado(5).perimetro()
var perimetro2 = Formas.Retangulo(altura: 10, largura: 5).perimetro()
var perimetro3 = Formas.Ponto.perimetro()
var triangulo = Formas.Triangulo(altura: 20, base: 10).area()


