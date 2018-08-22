//
//  SearchInRotateSortedArray.swift
//  interviewExp
//
//  Created by wangyan on 2018/7/20.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation

class SearchInRotateSortedArray {
    
    static func solution(array: [Int], target: Int) -> Int {
        
        if array.isEmpty {
            
            return -1
        }
        
        if array[0] < array[array.count - 1] {//顺序，非旋转数组，直接调用二分查找
            
            return binarySearch(array: array, target: target, start: 0, end: array.count - 1)
        }else {
            
            //step.1 找到旋转数组的最小元素的位置，即找到两个有序数组的分界线
            let minIndex = findMinNumberIndexInRotateSortedArray(array: array)
            
            //step2. 找到目标值所处于的范围，然后在范围内进行二分查找
            if (target > array[0]) {
                
                return binarySearch(array: array, target: target, start: 0, end: minIndex - 1)
            }else if (target < array[0]) {
                
                return binarySearch(array: array, target: target, start: minIndex, end: array.count - 1)
            }else {
                
                return 0
            }
        }
    }
    
    static func findMinNumberIndexInRotateSortedArray(array: [Int]) -> Int {
        
        var left = 0
        var right = array.count - 1
        var mid = left
        
        while array[left] > array[right] {
            
            if right - left == 1 {
                
                return right
            }
            
            mid = (left + right) / 2
            
            if array[mid] == array[left] && array[mid] == array[right] {
                
                return findMinInOrder(array: array, start: left, end: right)
            }
            
            if array[mid] >= array[left] {
                
                left = mid
            }else if array[mid] <= array[right] {
                
                right = mid
            }
        }
        
        return mid
    }
    
    static func findMinInOrder(array: [Int], start: Int, end: Int) -> Int {
        
        var minIndex = start
        var min = array[minIndex]
        for i in (start + 1)...end {
            
            if array[i] < min {
                
                min = array[i]
                minIndex = i
            }
        }
        
        return minIndex
    }
    
    static func binarySearch(array: [Int], target: Int, start: Int, end: Int) -> Int {
        
        var left = start
        var right = end
        while left <= right {
            
            let mid = (left + right) / 2
            
            if array[mid] == target {
                
                return mid
            }
            
            if target < array[mid] {
                
                right = mid - 1
            }else if target > array[mid] {
                
                left = mid + 1
            }
        }
        
        return -1
    }
}
