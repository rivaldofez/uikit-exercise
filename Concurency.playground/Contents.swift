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

