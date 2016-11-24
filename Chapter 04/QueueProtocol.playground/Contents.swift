import UIKit

protocol QueueProtocol {
    associatedtype QueueType
    mutating func addItem(item: QueueType)
    mutating func getItem() -> QueueType?
    func count() -> Int
}


struct IntQueue: QueueProtocol {
    var items = [Int]()
    
    mutating func addItem(item: Int) {
        items.append(item)
    }
    
    mutating func getItem() -> Int? {
        if items.count > 0 {
            return items.remove(at: 0)
        }
        else {
            return nil
        }
    }
    
    func count() -> Int {
        return items.count
    }
}


class GenericQueue<T>: QueueProtocol {
    var items = [T]()
    
    func addItem(item: T) {
        items.append(item)
    }
    
    func getItem() -> T? {
        if items.count > 0 {
            return items.remove(at: 0)
        } else {
            return nil
        }
    }
    
    func count() -> Int {
        return items.count
    }
}
