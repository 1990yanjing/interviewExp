//
//  StringToInt.swift
//  interviewExp
//
//  Created by wangyan on 2018/7/20.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation

class StringToInt {

    static func solution(target: String) -> Int64? {
        
        var ret: Int64 = 0
        var negative: Bool = false
        
        for (index, ch) in target.enumerated() {
            
            if index == 0 {
                
                if "\(ch)" == "-" {
                    
                    negative = true
                    continue
                }else if "\(ch)" == "+" {
                    
                    negative = false
                    continue
                }
            }
            
            if let digit = Int64("\(ch)") {
                
                if ret > ((Int64.max / 10) - digit) {
                    
                    ret = Int64.max
                    break;
                }
                ret = ret * 10 + digit
            }else {
                
                return nil
            }
        }
        
        ret = negative ? ret * -1 : ret
        return ret
    }
}
