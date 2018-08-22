//
//  JudgeLinkedListIntersect.swift
//  interviewExp
//
//  Created by wangyan on 2018/7/20.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation

class JudgeLinkedListIntersect {
    
    func solution<T>(listA: ListNode<T>, listB: ListNode<T>) -> Bool {
        
        var endA = listA
        while endA.next != nil {
            
            endA = endA.next!
        }
        
        var endB = listB
        while endB.next != nil {
            
            endB = endB.next!
        }
        
        return endA.isEqual(endB)
    }
}
