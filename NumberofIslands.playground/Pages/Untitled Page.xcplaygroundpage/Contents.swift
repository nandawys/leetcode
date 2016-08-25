//: Playground - noun: a place where people can play

import UIKit

class Solution {
    
    var iLen = 0
    var jLen = 0
    var tree: [Int] = []
    var grid: [[Character]] = []
    
    func numIslands(grid: [[Character]]) -> Int {
        self.grid = grid
        if grid.count <= 0 || grid[0].count <= 0 {
            return 0
        }
        iLen = grid.count
        jLen = grid[0].count
        var count = iLen*jLen
        tree = [Int](0..<count)
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "0" {
                    count -= 1
                    continue
                }
                if process(i-1, j: j, index: getIndex(i, j: j)) {
                    count -= 1
                }
                if process(i, j: j-1, index: getIndex(i, j: j)) {
                    count -= 1
                }
                if process(i+1, j: j, index: getIndex(i, j: j)) {
                    count -= 1
                }
                if process(i, j: j+1, index: getIndex(i, j: j)) {
                    count -= 1
                }
            }
        }
        return count
    }
    
    func process(i: Int, j: Int, index: Int) -> Bool {
        if i < 0 || i >= iLen || j < 0 || j >= jLen || grid[i][j] == "0" {
            return false
        }
        return union(getIndex(i, j: j), index2: index)
    }
    
    func getIndex(i: Int, j: Int) -> Int {
        return i*jLen + j
    }
    
    func findRoot(index: Int) -> Int {
        var root = index
        while root != tree[root] {
            tree[root] = tree[tree[root]]
            root = tree[root]
        }
        return root
    }
    
    func union(index1: Int, index2: Int) -> Bool {
        if findRoot(index1) == findRoot(index2) {
            return false
        }
        tree[findRoot(index1)] = findRoot(index2)
        return true
    }
}

let testCase = ["10011101100000000000","10011001000101010010","00011110101100001010","00011001000111001001","00000001110000000000","10000101011000000101","00010001010101010101","00010100110101101110","00001001100001000101","00100100000100100010","10010000000100101010","01000101011011101100","11010000100000010001","01001110001111101000","00111000110001010000","10010100001000101011","10100000010001010000","01100011101010111100","01000011001010010011","00000011110100011000"].map {
    [Character]($0.characters) }


Solution().numIslands(testCase)












