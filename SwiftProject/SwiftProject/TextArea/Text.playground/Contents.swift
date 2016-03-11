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