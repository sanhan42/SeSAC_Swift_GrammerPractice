import UIKit
import Darwin

func nicknamePrint() {
    print("저는 고래밥입니다.")
}
func nicknamePrint(nickName:String?) -> Bool {
    if let nickName = nickName {
        print("저는 \(nickName)입니다.")
        return true
    } else {
        return false
    }
}
nicknamePrint()
nicknamePrint(nickName: "Sanhan")
print(nicknamePrint(nickName: nil))

func getGameCharacterInfo(name: String, age: Int) -> (String, Int) {
    let character = ["도적", "도사", "주술사", "전사", "격투가"]
    let select = character.randomElement()!
    let level = Int.random(in: 1...8)
    return (select, level)
}

var numberArray = [1,2,3,4,5,6,7,8,9,10]

