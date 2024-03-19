import Foundation

struct Product: Hashable ,Codable, Identifiable {
    let id: Int
    let productName: String
    let description: String
    let quantity: Int
    let price: Double
    let image: String
    let categoryId: Int

    enum CodingKeys: String, Hashable, CodingKey {
        case id
        case productName = "product_name"
        case description
        case quantity
        case price
        case image
        case categoryId = "category_id"
    }
}


struct ProductsResponse: Hashable, Codable {
    let status: Int
    let message: String
    let data: [Product]
}
