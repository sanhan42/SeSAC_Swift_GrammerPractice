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
print("T",tab,"E",tab,"S",tab,"T",tab,"!")
print("T E S T !")
//: [Next](@next)
