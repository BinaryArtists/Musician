//: Playground - noun: a place where people can play

import Cocoa

class Animal {
    var name:String = "ss"
}

class Person {
    var name:String! = "xiaohei"
    var dog:Animal?
}

let a1 = Animal()
let p1 = Person()
p1.dog = a1
print(p1.dog?.name)


//Swift 高级用法

//if case
let age = 20
let sex = "girl"
if case 18...25 = age where sex == "girl"{
    print("交往吧")
}


var array = [1,2,3,4,5]
let result1 = array.map { (number) -> String in
    return String(number)
}
let result2 = array.map {
    return String($0)
}

let result3 = result1.map { (string) -> Int in
    return Int(string)!
}

