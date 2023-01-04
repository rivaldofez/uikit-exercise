import UIKit

enum Color: String {
case red = "red"
case blue = "blue"
case green = "green"
}

let count = 5

func show(color: Color, count: Int){
    for _ in 1...count {
        print(color.rawValue)
    }
}

let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
let utilityQueue = DispatchQueue.global(qos: .utility)
let backgroundQueue = DispatchQueue.global(qos: .background)

DispatchQueue.main.async {
    utilityQueue.async {
        show(color: .green, count: count)
    }
    backgroundQueue.async {
        show(color: .blue, count: count)
    }
    userInteractiveQueue.async {
        show(color: .red, count: count)
    }
}

class ThreadSafeArray {
    let isolation = DispatchQueue(label: "com.dicoding.dispatchbarrier", attributes: .concurrent)
    
    private var _array: [Int] = []
    
    var array: [Int] {
        get {
            return isolation.sync {
                _array
            }
        }
        set {
            isolation.async(flags: .barrier) {
                self._array = newValue
            }
        }
    }
}

var value = 5
let workItem = DispatchWorkItem {
    value += 5
}

workItem.perform()


let queue = DispatchQueue(label: "com.dicoding.dispatchworkitem", qos: .utility)
queue.async(execute: workItem)

workItem.notify(queue: DispatchQueue.main) {
    print("Final value: \(value)")
}


func task1(dispatchGroup: DispatchGroup) {
    let queue = DispatchQueue(label: "com.dicoding.dispatchgroup.task1")
    
    queue.async {
        sleep(1)
        print("Task 1 executed")
        dispatchGroup.leave()
    }
}

func task2(dispatchGroup: DispatchGroup) {
    DispatchQueue.global().async {
        sleep(2)
        print("Task 2 executed")
        dispatchGroup.leave()
    }
}

func task3(dispatchGroup: DispatchGroup) {
    DispatchQueue.main.async {
        print("Task 3 executed")
        dispatchGroup.leave()
    }
}

let dispatchGroup = DispatchGroup()

dispatchGroup.enter()
task1(dispatchGroup: dispatchGroup)
dispatchGroup.enter()
task2(dispatchGroup: dispatchGroup)
dispatchGroup.enter()
task3(dispatchGroup: dispatchGroup)

dispatchGroup.notify(queue: DispatchQueue.main) {
    print("All task finished")
}


func expensiveTask(data: String, completion: @escaping (String) -> Void) {
    let queue = DispatchQueue(label: "com.dicoding.completionblock")
    
    queue.async {
        print("Processing: \(data)")
        sleep(2) // Imitate expensive task
        completion("Processing \(data) finished")
    }
}

let mainQueue = DispatchQueue(label: "com.dicoding.main", qos: .userInteractive)
mainQueue.async {
    expensiveTask(data: "Get User") { result in
        print(result)
    }
    
    print("Main Queue Run")
}
