// Minimum Moves to Capture The Queen
// O(1), O(1)
func minMovesToCaptureTheQueen(_ a: Int, _ b: Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) -> Int {
    if a == e {  // rock in same row
        if a == c && (d-b) * (d-f) < 0 {return 2} // if bishop in between
        return 1
    }    
    if b == f { // rock in same col
        if b == d && (c-a) * (c-e) < 0 {return 2} // if bishop in between
        return 1
    }
    if c-e == d-f { // bishop in diagonal \
        if a-e == b-f && (a-c) * (a-e) < 0 {return 2} // if rock in between
        return 1
    }
    if c-e == f-d { // bishop in diagonal /
        if a-e == f-b && (a-c) * (a-e) < 0 {return 2} // if rock in between
        return 1
    }
    return 2
}