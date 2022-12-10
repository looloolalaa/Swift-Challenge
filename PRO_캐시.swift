// LRU Cache
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count*5 }
    
    var cache: [String: Int] = [:]
    var time = 0
    for city in cities {
        let city = city.uppercased()
        
        if cache.keys.contains(city) {
            time += 1
            cache[city] = 0
        } else {
            time += 5
            if cache.count < cacheSize {
                cache[city] = 0
            } else {
                let removed = cache.keys.max() { cache[$0]! < cache[$1]! }!
                cache[removed] = nil
                cache[city] = 0
            }
        }
        
        for (key, _) in cache {
            cache[key]! += 1
        }
    }
    return time
}
