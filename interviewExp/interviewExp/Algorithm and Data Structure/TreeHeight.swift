//
//  TreeHeight.swift
//  interviewExp
//
//  Created by wangyan on 2018/7/20.
//  Copyright © 2018年 wangyan. All rights reserved.
//

import Foundation

class TreeNode {
    
    var value: String
    
    var left: TreeNode?
    
    var right: TreeNode?
    
    init(value: String, left: TreeNode? = nil, right: TreeNode? = nil) {
        
        self.value = value
        self.left = left
        self.right = right
    }
}

class TreeHeight {
    
    static func solutionByDeep(root: TreeNode?) -> Int {
        
        if root == nil {
            
            return 0
        }
        
        print(root!.value)
        let leftHeight = solutionByDeep(root: root?.left)
        let rightHeight = solutionByDeep(root: root?.right)
        
        return 1 + leftHeight > 1 + rightHeight ? (1 + leftHeight) : (1 + rightHeight)
    }
    
    static func solutionByWidth(root: TreeNode?) -> Int {
        
        if root == nil {
            
            return 0
        }
        
        var queue = [TreeNode]()
        var height = 0
        queue.append(root!)
        
        while !queue.isEmpty {
            
            let levelCnt = queue.count
            var count = 0
            while count < levelCnt {
                
                let node = queue.removeFirst()
                print(node.value)
                count += 1
                
                if let left = node.left {
                    
                    queue.append(left)
                }
                if let right = node.right {
                    
                    queue.append(right)
                }
            }
            height += 1
        }
        
        return height
    }
    
    static func midRootTraversal(root: TreeNode?) {
        
        if root == nil {
            
            return
        }
        
        var stackArray: [TreeNode] = []
        var worker = root
        while worker != nil || !stackArray.isEmpty {
            
            while worker != nil {
                
                stackArray.append(worker!);
                worker = worker?.left
            }
            
            if !stackArray.isEmpty {
                
                worker = stackArray.removeLast()
                print(worker!.value)
                worker = worker?.right
            }
        }
    }
    
    static func getTestTree() -> TreeNode {
        
        let root = TreeNode(value: "A")
        let node1 = TreeNode(value: "B")
        let node2 = TreeNode(value: "C")
        let node3 = TreeNode(value: "D")
        let node4 = TreeNode(value: "E")
        let node5 = TreeNode(value: "F")
        let node6 = TreeNode(value: "G")
        let node7 = TreeNode(value: "H")
        
        root.left = node1
        root.right = node2
        root.left!.left = node3
        root.left!.right = node4
        root.right!.left = node5
        root.right!.right = node6
        root.left!.left?.left = node7
        
        return root
    }
}
