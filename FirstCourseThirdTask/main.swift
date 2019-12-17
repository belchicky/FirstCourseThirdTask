import Foundation
import FirstCourseThirdTaskChecker

let checker = Checker()

// MARK: - Задание 1

class StackLifo: ArrayInitializableStorage {
    
    private var myArray: [Int] = []
    override public var count: Int { myArray.count }
    
    required init(array: [Int]) {
        
        super.init(array: array)
        self.myArray = array
    }
    
    required init() {
        super.init()
    }
    
    override func push(_ element: Int) {
        myArray.append(element)
    }
    
    override func pop() -> Int {
        myArray.removeLast()
    }
}

class QueueFifo: ArrayInitializableStorage {
    
    private var myArray: [Int] = []
    override public var count: Int { myArray.count }
    
    required init(array: [Int]) {
        
        super.init(array: array)
        self.myArray = array
    }
    
    required init() {
        super.init()
    }
    
    override func push(_ element: Int) {
        myArray.append(element)
    }
    
    override func pop() -> Int {
        myArray.removeFirst()
    }
}

let stack = StackLifo()
let queue = QueueFifo()

checker.checkInheritance(stack: stack, queue: queue)

// MARK: - Задание 2

struct StackLifoStructure : ArrayInitializable, StorageProtocol {
    init() {
        myArray = [Int]()
    }
    
    var myArray: [Int]
    var count: Int { myArray.count }
    
    init(array: [Int]) {
        self.myArray = array
    }
    
    mutating func push(_ element: Int) {
        myArray.append(element)
    }
    
    mutating func pop() -> Int {
        myArray.removeLast()
    }
}

struct QueueFifoStructure: ArrayInitializable, StorageProtocol {
    init() {
        myArray = [Int]()
    }
    
    var myArray: [Int] = [Int]()
    var count: Int { myArray.count }
    
    init(array: [Int]) {
        self.myArray = array
    }
    
    mutating func push(_ element: Int) {
        myArray.append(element)
    }
    
    mutating func pop() -> Int {
        myArray.removeFirst()
    }
}

let stackStructure = StackLifoStructure()
let queueStructure = QueueFifoStructure()
checker.checkProtocols(stack: stackStructure, queue: queueStructure)

// MARK: - Задание 3

extension User : JSONSerializable {
    public func toJSON() -> String {
        return "{\"fullName\": \"\(self.fullName)\", \"email\": \"\(self.email)\"}"
    }
}

extension User: JSONInitializable {
    public convenience init(JSON: String) {
        
        let data = JSON.data(using: .utf8)!
        let myArray = try! JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String:String]
        
        self.init()
        self.email = myArray!["email"]!
        self.fullName = myArray!["fullName"]!
    }
}

checker.checkExtensions(userType: User.self)
