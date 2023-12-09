// Count of Matches in Tournament
// O(log n), O(1)
func numberOfMatches(_ n: Int) -> Int {
    var matches = 0, teams = n
    while teams > 1 {
        var nextTeams = teams / 2
        matches += teams / 2
        if teams % 2 == 1 {
            nextTeams += 1
        }
        teams = nextTeams
    }
    return matches
}