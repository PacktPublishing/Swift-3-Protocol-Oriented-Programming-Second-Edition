import UIKit

protocol MyProtocol {
    associatedtype E
    
    var items: [E] {get set}
    mutating func add(item: E)
}

struct MyIntType: MyProtocol {
    
    var items: [Int] = []
    mutating func add(item: Int) {
        items.append(item)
    }
}

struct MyGenericType<T>: MyProtocol {
    
    var items: [T] = []
    mutating func add(item: T) {
        items.append(item)
    }
}