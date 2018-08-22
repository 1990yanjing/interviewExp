//
//  FindMinKInArray.swift
//  interviewExp
//
//  Created by wangyan on 2018/8/3.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation

class FindMinKInArray {
    
    
    static func solution(a: [Int], k: Int) -> [Int] {
        
        if k >= a.count {
            
            return a
        }
        
        var temp = a
        var low = 0
        var high = a.count - 1
        var index = partition(a: &temp, start: low, end: high)
        while index != k - 1 {
            
            if index > k - 1 {
                
                high = index - 1
            }else {
                
                low = index + 1
            }
            index = partition(a: &temp, start: low, end: high)
        }
        
        return Array(temp[0..<k])
    }
    
    static func partition(a: inout [Int], start: Int, end: Int) -> Int {
        
        a.swapAt(start, end);
        
        var small = start;
        
        for i in (start..<end) {
            
            if a[i] < a[end] {
                
                if i != small {
                    
                    a.swapAt(small, i)
                }
                small += 1
            }
        }
        a.swapAt(end, small)
        
        return small;
    }
}
