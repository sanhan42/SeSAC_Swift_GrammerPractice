//: [Previous](@previous)

import UIKit

struct User {
    // 인스턴스 생성 여부와 상관없이 타입 프로퍼티의 값은 하나다!
    static var originalname = "진짜이름" // 타입 저장 프로퍼티
    var nickname = "고래밥" // 인스턴스 저장 프로퍼티
}

var user1 = User()
user1.nickname = "올라프"
print(user1.nickname, User.originalname)
User.originalname = "리Jack"

var user2 = User()
print(user2.nickname,User.originalname)

var user3 = User()
print(user3.nickname,User.originalname)

var user4 = User()
print(user4.nickname,User.originalname)
//: [Next](@next)

/*
 연산 프로퍼티, 계산 프로퍼티 (인스턴스 연산 프로퍼티 / 타입 연산 프로퍼티)
 */

struct BMI {
    var nickname:String {
        willSet(newNickname) {
            print("유저 닉네임이 \(nickname)에서 \(newNickname)로 변경될 예정이에요.")
        }
        didSet {
            print("유저 닉네임이 \(oldValue)에서 \(nickname)으로 변경되었습니다.")
        }
    }
    var weight:Double
    var height:Double
    // 연산 프로퍼티는 보통 저장 프로퍼티를 활용해서 원하는 값을 반환하는 용도로 주로 사용!
    // 'let' declarations cannot be computed properties - 계산하는 값에 따라 결과가 다 달라질 수 있기 때문!
    var BMIResult: String {
        get{
            let bmiValue = (weight*weight)/height
            let bmiStatus = bmiValue < 18.5 ? "저체중" : "정상 이상"
            return "\(nickname)님의 BMI 지수는 \(bmiValue) 이고, \(bmiStatus)입니다!"
        }
        // set이 없다면, 읽기 전용 (read-only) 프로퍼티.
        set {
            nickname = newValue
        }
    }
}

var bmi = BMI(nickname: "고래밥", weight: 78, height: 180)
print(bmi.BMIResult)
bmi.BMIResult = "Test"

class FoodRestaurant {
    let name = "잭치킨"
    var totalOrderCount = 0
    var lastOrderCount = 0
    
    var nowOrder:Int {
        get{
            return lastOrderCount
        }
        set { // 기본 파라미터 : newValuse
            lastOrderCount = newValue
            totalOrderCount += newValue
        }
    }
    var profit:Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            nowOrder = newValue / 5000 - totalOrderCount
            totalOrderCount = newValue / 5000
        }
    }
}

let food = FoodRestaurant()
print(food.profit)
food.totalOrderCount += 20
print(food.profit)
food.profit = 400000
print(food.totalOrderCount)
print(food.lastOrderCount)

// 열거형은 타입 자체 -> 인스턴스 생성이 불가능하다. -> 초기화 구문 X
// 인스턴스 생성을 통해서 접근할 수 있는 인스턴스 저장 프로퍼티 사용 불가!!
// 메모리의 관점에서 보면, 열거형은 런타임이 아닌 빌드될 때, 메모리에 확정!
// 열거형이 컴파일 타임에 확정되어야 한다!
// 그렇기에, 타입 저장 프로퍼티와 인스턴스 연산 프로퍼티는 사용 가능하다.
enum ViewType{
    case start
    case change
}

// 타입 프로퍼티는 인스턴스와 상관없이 접근 가능! >> 따라서 열거형에서 타입 저장 프로퍼티, 타입 연산 프로퍼티는 모두 사용 가능!
// 인스턴스 저장 프로퍼티는 메모리에, 값이 달라질 수 있음.

// 타입 저장 프로퍼티, 타입 연산 프로퍼티, 인스턴스 저장 프로퍼티, 인스턴스 연산 프로퍼티

class TypeFoodRdstaurant {
    static let name = "잭" // 타입 상수 저장 프로퍼티
    static var totalOrderCount = 10 {
        willSet { // 변경 되기 직전에 실행
            print("총 주문 건수가 \(totalOrderCount)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet { // 변경 되고난 직후에 실행
            print("총 주문 건수가 \(oldValue)에서 \(totalOrderCount)로 변경되었습니다.")
        }
    }
    
    static var nowOrder: Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue
        }
    }
}

TypeFoodRdstaurant.nowOrder // 타입 연산 프로퍼티 Get
TypeFoodRdstaurant.nowOrder = 15 // 타입 연산 프로퍼티 Set
TypeFoodRdstaurant.nowOrder

/// Property Observer : 저장 프로퍼티에서 주로 사용되고, 저장 프로퍼티 값을 관찰을 하다가 변경이 될 것 같을 때 또는 변경이 되었을 때 호출됩!! (willSet / didSet)

class Coffee {
    static var name = "아메리카노"
    static var shot = 2
    var price = 4900
    
    func plusShot() {
        Coffee.shot += 1
        price += 300
    }
    
    // 타입 메서드를 오버라이딩 해서 사용하려면 static 대신 class라는 키워드를 써줘야 한다.
    // 구조체는 상속이 불가능하고, 따라서 오버라이딩이 있을 수 없다. 때문에
    class func minusShot() {
        shot -= 1
    }
}

var americano = Coffee()
//Coffee.plusShot()
Coffee.plusShot(americano)
print(americano.price)

class Latte:Coffee {
    override func plusShot() {
    }
    override class func minusShot() {
    }
}


struct Coffee2 {
    static var name = "아메리카노"
    static var shot = 2
    var price = 4900
    
    mutating func plusShot() {
        Coffee.shot += 1
        price += 300 // 구조체의 메서드에서 인스턴스 프로퍼티의 값을 변경해주기 위해선, mutating 키워드를 붙여주어야 한다.
    }
}
