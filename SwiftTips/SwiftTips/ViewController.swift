//
//  ViewController.swift
//  SwiftTips
//
//  Created by liyoucheng on 2019/3/19.
//  Copyright © 2019年 JZYI. All rights reserved.
//

import UIKit

// Mark: - protocol
// 将protocol的方法声明为mutating

protocol Vehicle {
    
    var numberOfWheels: Int { get }
    var color: UIColor { get set }
    
    // 对结构体、枚举加mutating, 对class无影响
    mutating func changeColor()
}

struct MyCar: Vehicle {
    
    let numberOfWheels = 4
    var color = UIColor.blue
    
    mutating func changeColor() {
        
        color = .red
    }
}

// Mark: - Sequence

func testSequenct() {
    
    let arr = [ 0, 1, 2, 3, 4 ]
    for i in ReverseSequence(array: arr) {
        
        print("Index \(i) is \(arr[i])")
    }
}

class ReverseIterator<T>: IteratorProtocol {
    
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        
        if currentIndex < 0 {
            
            return nil
        }
        else {
            
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}

struct ReverseSequence<T>: Sequence {
    
    var array: [T]
    
    init(array: [T]) {
        
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>
    
    func makeIterator() -> ReverseIterator<T> {
        
        return ReverseIterator(array: self.array)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testKLH()
//        testSelector()
        testSequenct()
    }


    
    // MARK: - Selector
    
    func testSelector() {
        
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam(objc:))
        let method = #selector(turn(by:speed:))
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(callMe), userInfo: nil, repeats: true)
        
//        let method = #selector(commonFunc)
        
        let method1 = #selector(commonFunc as () -> ())
        let method2 = #selector(commonFunc as (Int) -> Int)
    }
    
    // Swift4中，默认情况下所有的Swift方法在Objective-C中都是不可见的
    // @objc 将方法暴露给Objective-C，才能进行使用
    
    // 对于单个方法，前面添加 @objc
    // 对于整个类，前面添加 @objcMembers
    @objc func callMe() {
    
        print("时间 \(Date.init())")
    }
    
    @objc func callMeWithParam(objc: AnyObject) {
        
    }
    
    @objc func turn(by angle: Int, speed: Float) {
        
    }
    
    @objc func commonFunc() {
        
    }
    
    @objc func commonFunc(input: Int) -> Int {
        
        return input
    }
    
    // MARK: - 柯里化
    // 量产相似方法
    func testKLH() {
        
        let addTwo = addTo(2)
        let result = addTwo(6)
        print(result)
        
        let greaterThan10 = greaterThan(10)
        print(greaterThan10(13))
        print(greaterThan10(9))
        
    }
    
    func addOne(num: Int) -> Int {
        
        return num + 1;
    }
    
    func addTo(_ adder: Int) -> (Int) -> Int {
        
        return {
            num in
            return num + adder
        }
    }
    
    
    func greaterThan(_ compare: Int) -> (Int) -> Bool {
        
        return {
            $0 > compare
        }
    }

}

