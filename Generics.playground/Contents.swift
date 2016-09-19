//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



struct StackGenerator<T>: GeneratorType {
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: SequenceType {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(f: Element -> U) -> Stack<U>{
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(4)
var doubledStack = intStack.map({2 * $0})
print(intStack.pop())
print(intStack.pop())
print(intStack.pop())
print(doubledStack.pop())
print(doubledStack.pop())

var stringStack = Stack<String>()
stringStack.push("string doida")
stringStack.push("string feia")
print(stringStack.pop())

func myMap<T,U>(items: [T], f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLenghts = myMap(strings) {$0.characters.count}
print(stringLenghts)

func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}
print(checkIfEqual(1, 1))
print(checkIfEqual("string", "otura string"))
print(checkIfEqual("bb", "bb"))

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, _ second: U) -> Bool {
    return first.description == second.description
}
print(checkIfDescriptionsMatch(Int(1), UInt(1)))
print(checkIfDescriptionsMatch(1, 1.0))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackGenerator = StackGenerator(stack: myStack)
while let value = myStackGenerator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for-in loop: got \(value)")
}

//func pushItemsOntoStack<Element>(inout stack: Stack<Element>, fromArray array: [Element]){
func pushItemsOntoStack<Element, S: SequenceType where S.Generator.Element == Element>(inout stack: Stack<Element>, fromSequence sequence: S){
    for item in sequence {
        stack.push(item)
    }
}
var myOtherStack = Stack<Int>()
pushItemsOntoStack(&myOtherStack, fromSequence: [22,33,4])
pushItemsOntoStack(&myStack, fromSequence: myOtherStack)

for value in myStack {
    print("after pushing: got \(value)")
}

