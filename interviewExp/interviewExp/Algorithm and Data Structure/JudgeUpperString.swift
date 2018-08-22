//
//  JudgeUpperString.swift
//  interviewExp
//
//  Created by wangyan on 2018/8/3.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation


class JudgeUpperString {
    
    // 判断字符串中是否大写字母全部在小写字母的前面
    // Solution: 找到字符串中第一个小写字母，然后判断其后面的整个子串是否为全小写的字符串即可
    static func solution(str: String) -> Bool {
        
        for index in str.indices.indices {
            
            if !isUpperCase(str: "\(str[index])") {
                
                let sub = str[index..<str.endIndex]
                return islowerCase(str:"\(sub)")
            }
        }
        
        return true
    }
    
    static func isUpperCase(str: String) -> Bool {
    
        return str.uppercased() == str
    }
    
    static func islowerCase(str: String) -> Bool {
        
        return str.lowercased() == str
    }
}

