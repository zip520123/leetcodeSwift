//Shortest Way to Form String
//O(m*n) O(n)
    func shortestWay(_ source: String, _ target: String) -> Int {
        var set = Set<Character>()
        for char in source {
            set.insert(char)
        }
        for char in target {
            if set.contains(char) == false {
                return -1
            }
        }
        let sArr = Array(source), tArr = Array(target)
        var i = 0, j = 0, count = 0
        while j < tArr.endIndex {
            if sArr[i] == tArr[j] {
                j += 1  
            } 
            i += 1
            if i == sArr.endIndex {
                count += 1
                i = 0
            }
        }
        if i > 0 {
            count += 1
        }
        return count
    }
//O(m*n) O(1)
    func shortestWay(_ source: String, _ target: String) -> Int {
        let sArr = Array(source), tArr = Array(target)
        var i = 0, j = 0, count = 0
        while j < tArr.endIndex {
            var originJ = j
            for i in 0..<sArr.endIndex {
                if sArr[i] == tArr[j] {
                    j += 1
                    if j == tArr.endIndex {
                        break
                    }
                }
            }
            count += 1
            if j == originJ {
                return -1
            }
        }
        return count
    }

//O(log source*s) O(source)
/*
the time complexity is better than O (MN), should be O(logM * N) or O (N)
to find a logM way, it is easy to think of binary search. for each char in tar, we need loop from j to end, to find a char same as tar[i].
we can build a map which key is from 'a' -> 'z', the value is idx for this char in src. because idx is add from small to big. when we iterate tar[i], we can easily to find the tar[i]'s idx list. to search is there a idx is larger or equal than j+1. it is logM. and we have N char in tar, so the time complexity is N * logM
*/
    func shortestWay(_ source: String, _ target: String) -> Int {
        let sArr = Array(source), tArr = Array(target)
        var dict = [Character:[Int]]()
        for (i, char) in sArr.enumerated() {
            dict[char, default:[]].append(i)
        }
        
        var j = 0, count = 1
        for char in tArr {
            guard let arr = dict[char] else {return -1}
            if arr.last! < j {
                count += 1
                j = 0
            }
            var l = 0, r = arr.endIndex - 1
            while l<r {
                let mid = (l+r)>>1
                if arr[mid] < j {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            j = arr[l] + 1
            
        }
        return count
    }

//
    /*


public int shortestWay(String source, String target) {
	char[] cs = source.toCharArray(), ts = target.toCharArray();
	int[][] idx = new int[26][cs.length];
	for (int i = 0; i < cs.length; i++) idx[cs[i] - 'a'][i] = i + 1;
	for (int i = 0; i < 26; i++) {
		for (int j = cs.length - 1, pre = 0; j >= 0; j--) {
			if (idx[i][j] == 0) idx[i][j] = pre;
			else pre = idx[i][j];
		}
	}
	int res = 1, j = 0;
	for (int i = 0; i < ts.length; i++) {
		if (j == cs.length) {
			j = 0;
			res++;
		}
		if (idx[ts[i] - 'a'][0] == 0) return -1;
		j = idx[ts[i] - 'a'][j];
		if (j == 0 ) {
			res++;
			i--;
		}
	}
	return  res;
}

public int shortestWay(String source, String target) {
	char[] cs = source.toCharArray(), ts = target.toCharArray();
	int[][] idx = new int[cs.length][26];
	idx[cs.length - 1][cs[cs.length - 1] - 'a'] = cs.length; 
	for (int i = cs.length - 2; i >= 0; i--) {
		idx[i] = Arrays.copyOf(idx[i + 1],26);
		idx[i][cs[i] - 'a'] = i + 1; 
	}
	int j = 0, res = 1;
	for (int i = 0; i < ts.length; i++) {
		if (j == cs.length) {
			j = 0;
			res++;
		}
		j = idx[j][ts[i] - 'a'];
		if (idx[0][ts[i] - 'a'] == 0) return -1;
		if (j == 0) {
			res++;
			i--;
		}
	}
	return res;
}
*/