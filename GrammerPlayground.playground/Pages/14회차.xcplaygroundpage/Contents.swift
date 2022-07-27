//: [Previous](@previous)

import Foundation

// 1. 옵셔널 바인딩

// ex. 쇼핑 리스트 추가
var shoplist:String? = "신발 사기"
var shoplist2: String? = "모니터 사기"

if shoplist != nil && shoplist2 != nil {
    print("\(shoplist!), \(shoplist2!) 완료!")
} else {
    print("글자를 입력해주세요")
}

if let s = shoplist, let s2 = shoplist2, (2...6).contains(s.count) {
    print("\(s), \(s2) 완료!")
    // 선언한 s, s2 변수는 if 중괄호 안에서만 사용 가능.
} else {
    print("글자를 입력해주세요")
}

//shoplist = nil
func optionalBindingFunction() {
    guard let s = shoplist else {
        print("글자를 입력해주세요")
        return
    }
    // guard문에서 선언한 변수는 guard 구문이 선언된 스코프 안에서, 변수 사용이 가능하다.
    print("\(s) 완료!")
}

optionalBindingFunction()

// 2. 인스턴스 프로퍼티 vs 타입 프로퍼티
class User {
    var nickname = "고래밥" // [상수|변수] 저장 프로퍼티, 인스턴스 프로퍼티
    static var staticNickname = "오리온" // [상수|변수] 저장 프로퍼티, 타입 프로퍼티
    // 선언시 초기화를 해줘야 한다.
}

let user = User()

User.staticNickname // 호출 시 메모리에 올라감. 인스턴스를 생성한다고 해서 초기화가 되지 않고, 사용할 때 초기화가 된다.

