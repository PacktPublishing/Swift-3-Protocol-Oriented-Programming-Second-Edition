import Cocoa

protocol List {
    associatedtype T
    mutating func add(item: T)
    func length() -> Int
    func get(index: Int) -> T?
}

struct ArrayList<T>: List {
    var items: [T]
    
    mutating func add(item: T) {
        items.append(item)
    }
    func length() -> Int {
        return items.count
    }
    func get(index: Int) -> T? {
        return items[index]
    }
}

class LinkedList<T>: List {
    var firstItem: T?
    
    func add(item: T) {
        //Add Item Logic
    }
    func length() -> Int {
        //return count
        return 0
    }
    func get(index: Int) -> T? {
        //Get Item at Index Logic
        return nil
    }
}

struct IntList: List {
    
    func add(item: Int) {
        //Add Item Logic
    }
    func length() -> Int {
        //return count
        return 0
    }
    func get(index: Int) -> Int? {
        //Get Item at Index Logic
        return nil
    }
}