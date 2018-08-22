//
//  Fabonacci; Fibonaccii; Fibonacoci;.swift
//  interviewExp
//
//  Created by wangyan on 2018/7/20.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation

class Fabonacci {
    
    static func solutionByRecursive(_ n: Int) -> Int{
        
        if n < 0 {
            
            return -1
        }
        
        if n == 0 {
            
            return 0
        }
        
        if n == 1 {
            
            return 1
        }
        
        return solutionByRecursive(n - 2) + solutionByRecursive(n - 1)
    }
    
    static func solutionByNonrecursive(_ n: Int) -> Int{
        
        if n < 0 {
            
            return -1
        }
        
        if n == 0 {
            
            return 0
        }
        
        if n == 1 {
            
            return 1
        }
        
        var fabMinusTwo = 0
        var fabMinusOne = 1
        var fabN = 0
        
        for _ in 2...n {
            
            fabN = fabMinusTwo + fabMinusOne
            fabMinusTwo = fabMinusOne
            fabMinusOne = fabN
        }
        
        return fabN
    }
}
