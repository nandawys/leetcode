//: Playground - noun: a place where people can play

import UIKit




//时间复杂度O(N2) 空间复杂度O(N2)
func fourSum(nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 { return []}
    var ret:[[Int]] = []
    var set = Set<String>()
    var newArray: [(Int,Int,Int)] = []
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            newArray.append((i,j,nums[i]+nums[j]))
        }
    }
    let arr = newArray.sort { (a, b) -> Bool in
        return nums[a.0]+nums[a.1] < nums[b.0]+nums[b.1]
    }
    var i = 0, j = arr.count-1
    while(i<j) {
        let val = nums[arr[i].0]+nums[arr[i].1]+nums[arr[j].0]+nums[arr[j].1]
        if val == target {
            var p = i, q = j
            while arr[p].2 == arr[i].2 && p < j { p++ }
            while arr[q].2 == arr[j].2 && q > i { q-- }
            for m in i..<p {
                for n in q+1...j {
                    if arr[m].0 == arr[n].0 || arr[m].0 == arr[n].1 || arr[m].1 == arr[n].0 || arr[m].1 == arr[n].1{
                        continue
                    }
                    let temp = [nums[arr[m].0],nums[arr[m].1],nums[arr[n].0],nums[arr[n].1]].sort()
                    if set.contains(temp.description) == false {
                        set.insert(temp.description)
                        ret.append(temp)
                    }
                }
            }
            i = p
            j = q
        } else if val < target {
            i++
        } else {
            j--
        }
    }
    return ret
}

let arr = [0,0,0,0]
let t1 = NSDate().timeIntervalSince1970
print(fourSum(arr, 0))
print(NSDate().timeIntervalSince1970-t1)


