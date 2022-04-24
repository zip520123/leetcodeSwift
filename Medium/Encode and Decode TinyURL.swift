//Encode and Decode TinyURL
//O(1),O(1)
class Codec {
    // Encodes a URL to a shortened URL.
    var dict = [UUID: String]()
    func encode(_ longUrl: String) -> String {
        let id = UUID()
        dict[id] = longUrl
        return id.uuidString
    }
    
    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        dict[UUID(uuidString: shortUrl)!]!
    }
}