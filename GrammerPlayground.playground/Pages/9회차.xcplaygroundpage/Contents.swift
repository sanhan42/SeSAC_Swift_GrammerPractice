//: [Previous](@previous)

import Foundation

// 옵셔널로 선언된 프로퍼티는 nil을 가질 수 있는 상황. 그래서 나중에 초기화 해도 된다.
// nil을 담을 수 없는 프로퍼티는 값이 무조건 있어야 한다. 그래서 초기화가 필요하다. => 이니셜라이저
class Monster {
    var name:String
    var level:Int
    
    init(name:String, l:Int) { // 초기화 구문. 이니셜라이저
        self.name = name // 매개변수와 프로퍼티가 이름이 같아서 구분을 위해 self가 필요한 것.
        level = l
    }
}

let easy = Monster(name: "쉬운몬스터", l:1) // 클래스를 초기화 한 것. 인스턴스를 만들었다.
var hard = easy
hard.level = 10

print(easy.name, easy.level)
print(hard.name, hard.level)

struct StructMonster {
    var name: String
    var level: Int
}

// let structMonst = StructMonster(name: <#T##String#>, level: <#T##Int#>)
// 구조체는 멤버와이즈 초기화 구문을 가짐.

//: [Next](@next)
