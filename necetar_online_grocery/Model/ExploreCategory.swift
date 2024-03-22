import Foundation

struct ExploreCategory: Codable, Hashable ,Identifiable {
    let id: Int
    let typeName: String
    let image: String
    let color: String
    
    enum CodingKeys: String, CodingKey , Hashable {
        case id
        case typeName = "type_name"
        case image
        case color
    }
}

struct ExploreResponse : Hashable, Codable {
    let status: Int
    let message: String
    let data: [ExploreCategory]
}
