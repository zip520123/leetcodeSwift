//Integer to English Words
func numberToWords(_ num: Int) -> String {
        let s = String(num).reversed()
        var sArr = Array(s)
        var i = 0
        while i < sArr.endIndex {
            if i % 4 == 0 {
                sArr.insert(",", at:i)
            }
            i += 1
        }
        let nums = String(sArr.reversed()).split(separator: ",")
        
        var r = nums.map { s -> String in
            let n = Int(s)!
            return hundredToWords(n)
        }

        if r.endIndex == 4 {
            r[0] += " Billion"
            r[1] += " Million"
            r[2] += " Thousand"
        }
        if r.endIndex == 3 {
            r[0] += " Million"
            r[1] += " Thousand"
        }
        if r.endIndex == 2 {
            r[0] += " Thousand"
        }
        i = r.endIndex - 1
        while i >= 0 {
            let n = Int(nums[i])!
            if n == 0 && r.endIndex > 1 {
                r.remove(at: i)
            }
            i -= 1
        }
        return r.joined(separator: " ")
    }
    
    func hundredToWords(_ nums: Int) -> String {
        if nums < 100 {
            return tenDigits(nums%100)
        }
        var res = oneDigit(nums/100) + " Hundred"
        let n = nums % 100 
        if n > 0 {
            res += " " + tenDigits(n)
        }
        return  res
    }
    
    func tenDigits(_ nums: Int) -> String {
        let n = nums % 100
        if n < 10 {
            return oneDigit(nums)
        }
        if n == 10 {
            return "Ten"
        }
        if n == 11 {
            return "Eleven"
        }
        if n == 12 {
            return "Twelve"
        }
        if n == 13 {
            return "Thirteen"
        }
        if n == 14 {
            return "Fourteen"
        }
        if n == 15 {
            return "Fifteen"
        }
        if n == 16 {
            return "Sixteen"
        }
        if n == 17 {
            return "Seventeen"
        }
        if n == 18 {
            return "Eighteen"
        }
        if n == 19 {
            return "Nineteen"
        }
        if n == 20 {
            return "Twenty"
        }
        if n > 20 && n < 30 {
            return "Twenty " + oneDigit(n)
        }
        if n == 30 {
            return "Thirty"
        }
        if n > 30 && n < 40 {
            return "Thirty " + oneDigit(n)
        }
        if n == 40 {
            return "Forty"
        }
        if n > 40 && n < 50 {
            return "Forty " + oneDigit(n)
        }
        if n == 50 {
            return "Fifty"
        }
        if n > 50 && n < 60 {
            return "Fifty " + oneDigit(n)
        }
        if n == 60 {
            return "Sixty"
        }
        if n > 60 && n < 70 {
            return "Sixty " + oneDigit(n)
        }
        if n == 70 {
            return "Seventy"
        }
        if n > 70 && n < 80 {
            return "Seventy " + oneDigit(n)
        }
        if n == 80 {
            return "Eighty" 
        }
        if n > 80 && n < 90 {
            return "Eighty " + oneDigit(n)
        }
        if n == 90 {
            return "Ninety"
        }
        if n > 90 {
            return "Ninety " + oneDigit(n)
        }
        return ""    
    }
    func oneDigit(_ nums: Int) -> String {
        let n = nums % 10
        if n == 0 {
            return "Zero"
        }
        if n == 1 {
            return "One"
        }
        if n == 2 {
            return "Two"
        }
        if n == 3 {
            return "Three"
        }
        if n == 4 {
            return "Four"
        }
        if n == 5 {
            return "Five"
        }
        if n == 6 {
            return "Six"
        }
        if n == 7 {
            return "Seven"
        }
        if n == 8 {
            return "Eight"
        }
        if n == 9 {
            return "Nine"
        }
        return ""
    }

    //
    class Solution {
    let words0_19 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
	let wordsTens = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
	let thousands = ["", "Thousand", "Million", "Billion"]
    func numberToWords(_ num: Int) -> String {
        if num == 0 {return "Zero"}
        var i = 0
        var num = num
        var res = ""
        while num > 0 {
            if num % 1000 > 0 {
                res = helper(num%1000) + thousands[i] + " " + res 
            }
            num /= 1000
            i += 1
        }
        return res.trimmingCharacters(in: .whitespaces)
    }
    
    func helper(_ num: Int) -> String {
        if num == 0 {
            return ""
        } else if num < 20 {
            return words0To19[num] + " "
        } else if num < 100 {
            return wordsTens[num/10] + " " +  helper(num%10)
        } else {
            return words0To19[num/100] + " Hundred " + helper(num%100)
        }
    }
}