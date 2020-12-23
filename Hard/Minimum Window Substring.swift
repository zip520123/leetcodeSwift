/*Minimum Window Substring*/
//time O(n) space O(1) or O(n)
func minWindow(_ s: String, _ t: String) -> String {
    var dict = [Character: Int]()
    for c in t {
        dict[c,default:0] += 1
    }
    let scount = s.count
    var tcount = t.count
    if scount < tcount {return ""}
    let sArr = Array(s)
    var left = 0, right = 0
    var minLength = Int.max
    var minStart = 0
    while(right<scount) {
        let c = sArr[right]
        dict[c,default:0] -= 1

        if dict[c,default:0] >= 0 {
            tcount -= 1
            while(tcount == 0) {
                if right - left < minLength {
                    minLength = right - left
                    minStart = left
                }
                let c2 = sArr[left]
                dict[c2,default:0] += 1
                if dict[c2]! > 0 {
                    tcount += 1
                }
                left += 1
            }
        } 
        right+=1
    }
    return minLength == Int.max ? "" : String(sArr[minStart...minStart + minLength])
}
let input = "ADOBECODEBANC"
let input2 = "ABC"
print(minWindow(input, input2))
// func minWindow(_ s: String, _ t: String) -> String {
        
//     var dict = [Character: Int]()
//     for c in t {
//         dict[c,default:0] += 1
//     }
//     let scount = s.count
//     var tcount = t.count
//     if scount < tcount {return ""}
//     let sArr = Array(s)
//     var res = ""
//     var left = 0, right = 0
//     var lres = 0, rres = scount
//     while(right<scount) {
//         let c = sArr[right]
//         dict[c,default:0] -= 1
//         if dict[c,default:0] >= 0 {
            
//             tcount -= 1
//             while(tcount == 0) {
//                 if res == "" || right - left < rres - lres {
//                     rres = right
//                     lres = left
//                     res = sArr[lres...rres].map{String($0)}.joined()
//                 }
//                 let c2 = sArr[left]
//                 dict[c2,default:0] += 1
//                 if dict[c2]! > 0 {
//                     tcount += 1
//                 }
//                 left += 1
//             }
//         } 
        
//         right+=1
//     }
    
//     return res
// }