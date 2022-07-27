//: [Previous](@previous)

import UIKit

enum DrinkSize {
    case short, tall, grande, venti
}

class DrinkClass {
    let name: String
    var count: Int
    var size: DrinkSize
    
    init(name:String, count: Int, size: DrinkSize) {
        self.name = name
        self.count = count
        self.size = size
    }
}

struct DrinkStruct {
    let name: String
    var count: Int
    var size: DrinkSize
}

let drinkClass = DrinkClass(name: "스무디", count: 2, size: .venti)
drinkClass.count = 5
drinkClass.size = .tall

print(drinkClass.name, drinkClass.count, drinkClass.size)

var drinkStruct = DrinkStruct(name: "스무디", count: 2, size: .venti)
drinkStruct.count = 5
drinkStruct.size = .tall

print(drinkStruct.name, drinkStruct.count, drinkStruct.size)


struct Poster {
    // 인스턴스 프로퍼티 - 구조체를 인스턴스로 생성 해야만, 그 인스턴스를 통해서 image 프로퍼티에 접근 가능
    var image:UIImage = UIImage(named: "star") ?? UIImage()
    
    // 구조체는 맴버와이즈 이니셜라이저를 갖고 있지만, 추가적인 구현도 가능하다!
    // 필요에 따라 초기화 구문을 여러 가지로 만들어서 사용할 수 있다!
    // 함수 오버로딩 특성을 활용해 하나의 초기화 구문인데 여러 구문처럼 쓸 수도 있다.
    init() {
        print("Poster Initialized")
    }
    init(defaultImage: UIImage) {
        self.image = defaultImage
    }
    init(customImage: UIImage? = UIImage(named: "star")) {
        self.image = customImage!
    }
    // swift - 함수 오버로딩. 매개변수 이름이 달라져도 다른 함수로 처리??
}

// 영화 타이틀, 러닝타임, 영상/화질 좋은 포스터 => 필요한 시점에 초기화 할 수 없을까?
// lazy 키워드 사용. - 저장을 지연시킴.
struct MediaInfo {
    var mediaTitle: String
    var mediaRuntime:Int
    lazy var mediaPoster: Poster = Poster()
}

var media = MediaInfo(mediaTitle: "오징어게임", mediaRuntime: 123)
print(media.mediaTitle)

// 타입 프로퍼티 : 기본적으로 지연 저장 프로퍼티 형태로 기본적으로 동작. lazy 키워드를 안 써도 된다. 오히려 써주면 오류. ('lazy' cannot be used on an already-lazy global)
struct User {
    static var name = "고래밥"
    static let age = 22
}
User.name   // 호출하는 시점에 메모리에 올라간다.
//: [Next](@next)
