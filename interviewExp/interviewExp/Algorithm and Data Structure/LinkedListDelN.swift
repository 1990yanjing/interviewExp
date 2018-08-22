//
//  LinkedListDelN.swift
//  interviewExp
//
//  Created by wangyan on 2018/7/20.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation

class ListNode<T> : NSObject {
    
    var value: T?
    
    var next: ListNode?
    
    init(value: T?, next: ListNode?) {
        
        self.value = value
        self.next = next
    }
}

class Solution<T> {

    static func deleteLastN(n: Int, head: ListNode<T>) -> ListNode<T>? {
        
        if n <= 0 {
            return nil
        }
        
        let dummyHead = ListNode<T>(value: nil, next: head)
        var ptrSlow = dummyHead
        var ptrFast: ListNode<T>? = ptrSlow
        
        for _ in 1...(n + 1) {
            
            if let ptr = ptrFast {
            
                ptrFast = ptr.next
            }else {
                
                return nil;
            }
         }
        
        while ptrFast != nil {
            
            ptrSlow = ptrSlow.next!
            ptrFast = ptrFast?.next
        }
        
        ptrSlow.next = ptrSlow.next?.next
        
        return dummyHead.next
    }
    
    static func printLinkedList(_ head: ListNode<T>?) {
    
        var ret = ""
        var worker: ListNode<T>? = head
        while worker != nil {
            
            if let value = worker?.value {
                
                ret += "\(value) -> "
            }else {
                
                ret = "empty -> "
            }
            worker = worker?.next
        }
        
        ret += "nil"
        print(ret)
    }
    
    static func getdefaultListForTest() -> ListNode<Int> {
        
        let head = ListNode<Int>(value: 1, next: nil)
        let ptr1 = ListNode<Int>(value: 2, next: nil)
        let ptr2 = ListNode<Int>(value: 3, next: nil)
        let ptr3 = ListNode<Int>(value: 4, next: nil)
        let ptr4 = ListNode<Int>(value: 5, next: nil)
        head.next = ptr1
        ptr1.next = ptr2
        ptr2.next = ptr3
        ptr3.next = ptr4
        
        return head
    }
}
