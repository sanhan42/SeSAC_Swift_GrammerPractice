//: [Previous](@previous)

import Foundation

enum CompassPoint {
    case north
    case south
    case east
    case west
}

var direction = CompassPoint.east
print(type(of: direction))

enum Planet {
    case mercury, venus, earth, mars, jupiter, seturn, uranus, neptune
}

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

var tab:Character = ASCIIControlCharacter.tab.rawValue
//print("T",tab,"E",tab,"S",tab,"T",tab,"!")
//print("T E S T !")
enum Computer {
    case cpu(core: Int, ghz:Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
}

var cpu1 = Computer.cpu(core: 6, ghz: 1.4)
var cpu2 = Computer.cpu(core: 8, ghz: 2.4)
var ram1 = Computer.ram(16, "DDR4")
var ram2 = Computer.ram(8, "DDR3")

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode1 = Barcode.upc(8, 85909, 51226, 3)
var productBarcode2 = Barcode.qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode1 {
case .upc(let numberSystem, let manufacurer, let product, let check)
    : print("UPC : \(numberSystem), \(manufacurer), \(product), \(check).")
case .qrCode(let productCode) : print("QR code : \(productCode).")
}

switch productBarcode2 {
case let .upc(numberSystem, manufacurer, product, check)
    : print("UPC : \(numberSystem), \(manufacurer), \(product), \(check).")
case let .qrCode(productCode) : print("QR code : \(productCode).")
}

//: [Next](@next)
