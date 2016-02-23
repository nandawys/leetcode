//: Playground - noun: a place where people can play

import UIKit




//时间复杂度O(N2) 空间复杂度O(N)
func threeSum(nums: [Int]) -> [[Int]] {
    var ret:[[Int]] = []
    var set = Set<String>()
    let arr = nums.sort()
    for k in 0..<arr.count {
        let val = -arr[k]
        var i = 0, j = arr.count-1
        while(i<j) {
            if i == k {
                i++
                continue
            }
            if j == k {
                j--
                continue
            }
            let sum = arr[i] + arr[j]
            if sum == val {
                let temp = [arr[k],arr[i],arr[j]].sort()
                if set.contains(temp.description) == false {
                    ret.append(temp)
                    set.insert(temp.description)
                }
                /**
                *   优化点，跳过相同元素!!!
                    如果不做这个优化会超时!!!
                */
                while(i<j && arr[i+1]==arr[i]) {
                    i++
                }
                while(i<j && arr[j-1]==arr[j]) {
                    j--
                }
                i++
                j--
                continue
            } else if sum < val {
                i++
            } else {
                j--
            }
        }
    }
    return ret
}

let arr = [-1,0,1]
let t1 = NSDate().timeIntervalSince1970
print(threeSum(arr))
print(NSDate().timeIntervalSince1970-t1)





