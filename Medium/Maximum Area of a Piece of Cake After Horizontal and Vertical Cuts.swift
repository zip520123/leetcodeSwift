//Maximum Area of a Piece of Cake After Horizontal and Vertical Cuts
//Sort the arrays, then compute the maximum difference between two consecutive elements for horizontal cuts and vertical cuts.
//O(n log n + m log m), O(n+m), n = horizontalCuts, m = verticalCuts
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        let sortedH = (horizontalCuts+[0,h]).sorted(), sortedV = (verticalCuts+[0,w]).sorted()
        var diffH = 0, diffV = 0
        
        for i in 0..<sortedH.endIndex-1 {
            diffH = max(sortedH[i+1]-sortedH[i], diffH)
        }
        for i in 0..<sortedV.endIndex-1 {
            diffV = max(sortedV[i+1]-sortedV[i], diffV)
        }
        
        return diffH * diffV % Int(1E9 + 7)
    }