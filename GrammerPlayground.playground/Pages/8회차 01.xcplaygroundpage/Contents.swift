//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground" // 선언과 초기화

var email:String?
email = "sangmin613@gmail.com" // 선언만 하고 나중에 초기화

type(of: greeting)
print(type(of: email))

var array = [1...10]
print(type(of: array))
var array2 = Array(repeating: 0, count: 10)
var array3: [Int]? = [Int](1...10)

// 삼항 연산자
let result = array3 == nil ? "값이 없음" : "값이 있음"

func test(){
    print("1")
}

func test2() {
    print("2")
}

array3 == nil ? test() : test2()
let testFunc = array3 == nil ? test : test2
testFunc()
print(type(of: testFunc))

// return 생략 - Swift 5.1부터 가능
func randomNumber() -> Int {
    Int.random(in: 1...100) // 한 줄 짜리 함수에서 가능.
}

let plusNumber  = randomNumber() + 10

// 매개변수 기본값
// 함수 오버로딩
func sayHello(nickname: String = "농부") -> String {
    return nickname + "님, 반갑습니다!"
}
sayHello()
sayHello(nickname: "고래밥")
func print(test:Int)->Int{
    return test
}
print(print(test: 3))

// 열거형 (ex. 성별 - 남, 여, 선택 안함 -> 블랙/파란/흰)
// 코드의 가독성에 있어서 좋음. 실수를 방지해 주기도 함.
/* RawValue 사용
 - 다른 플랫폼과 커뮤니케이션할 경우(예를 들어, 서버와 통신할 때), 결국 기본 자료형으로 사용해야 할 경우 */
enum Gender:String {
    case man = "남성"
    case woman = "여성"
    case nothing // "nothing"
}

var gender: Gender = .nothing

switch gender {
case .man: print("남성")
case .woman: print("여성")
case .nothing: print("선택 안함")
}

switch gender.rawValue {
case "남성": print("남성")
case "여성": print("여성")
default: print("선택 안함")
}

enum HTTPCode: Int {
    case OK // 0
    case NO_PAGE // 1
    case NOT_FOUND = 404
    case SERVER_ERROR // 405
    
    func showStatus()->String {
        switch self {
        case .OK : return "OK"
        case .NO_PAGE : return "잘못된 접근"
        case .NOT_FOUND : return "페이지를 찾을 수 없음"
        case .SERVER_ERROR : return "긴급점검"
        }
    }
}

var networkStatus: HTTPCode = .NO_PAGE
let resultStatus = networkStatus.showStatus()
print(resultStatus)
/* 상태 체크를 필요한 부분마다 swich 구문을 반복해서 작성하는 것이 아니라
 열거형 정의할 때, 메서드를 만들어 줘서 사용할 수 있음.
switch networkStatus {
case .OK: print ("정상")
case .NO_PAGE: print("잘못된 URL 주소")
default : print("기타")
} */
//: [Next](@next)
