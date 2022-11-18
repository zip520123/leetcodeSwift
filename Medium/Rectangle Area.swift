    //Rectangle Area
    //O(1)
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        return (ax2-ax1)*(ay2-ay1) + (bx2-bx1)*(by2-by1) - max(min(ax2,bx2)-max(ax1,bx1), 0) * max(min(ay2,by2)-max(ay1,by1), 0)
    }