//
//  MakeEvenFront.swift
//  interviewExp
//
//  Created by wangyan on 2018/8/3.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation

class MakeOddFront {
    
    static func solution(array: [Int]) -> [Int] {
        
        if array.count <= 1 {
            
            return array
        }
        
        var i = 0, j = array.count - 1
        var temp = array
        
        while i < j {
            
            while !isEven(a: temp[i]) {
                i += 1
            }
            
            while isEven(a: temp[j]) {
                j -= 1
            }
            
            if i < j {
                
                temp.swapAt(i, j)
            }
        }
        
        return temp
    }
    
    static func isEven(a: Int) -> Bool {
        
        return a % 2 == 0
    }
}
