//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

// SuperClass - 상대적인 관계에 의해 BossMonster의 SuperClass인 것.
// BaseClass - 상속 받은 것이 없기 때문.
class Monster {
    var clothes = "orange"
    var speed = 5
    var power = 20
    var expoint: Double = 500
    
    func attack() {
        print("몬스터 공격!!!")
    }
}

var easyMonster = Monster() // 인스턴스
easyMonster.clothes
easyMonster.attack()

// SubClass
class BossMonster : Monster {
    var levelLimit = 500
    func specialAttack() {
        print("스페셜 공격")
    }
    // 오버라이딩, 함수 재정의
    override func attack() {
        super.attack()
        print("오버라이드 공격!!")
    }
}

var boss = BossMonster()
boss.attack()
print(boss.clothes)
boss.specialAttack()
//: [Next](@next)

var miniMonster = Monster()
var anotherMonster = miniMonster
anotherMonster.power = 5000
print(miniMonster.power)
print(anotherMonster.power)

// 구조체 - 상속이 안됨.
// 구조체는 값 타입, 클래스는 참조 타입

