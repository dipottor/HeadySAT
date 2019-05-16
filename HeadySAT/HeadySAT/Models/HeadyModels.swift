//
//  HeadyModels.swift
//  HeadySAT
//
//  Created by Ravindra Kumbhar on 16/05/19.
//  Copyright © 2019 Ravindra Kumbhar. All rights reserved.
//

import Foundation


struct Category :Codable {
    
    let childCategories : [Int]?
    let id : Int?
    let name : String?
    let products : [CatProducts]?
    
    enum CodingKeys: String, CodingKey {
        case childCategories = "child_categories"
        case id = "id"
        case name = "name"
        case products = "products"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        childCategories = try values.decodeIfPresent([Int].self, forKey: .childCategories)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        products = try values.decodeIfPresent([CatProducts].self, forKey: .products)
    }
}

struct CatProducts : Codable {
    
    let dateAdded : String?
    let id : Int?
    let name : String?
    let tax : Tax?
    let variants : [Variant]?
    
    enum CodingKeys: String, CodingKey {
        case dateAdded = "date_added"
        case id = "id"
        case name = "name"
        case tax = "tax"
        case variants = "variants"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dateAdded = try values.decodeIfPresent(String.self, forKey: .dateAdded)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        tax = try Tax(from: decoder)
        variants = try values.decodeIfPresent([Variant].self, forKey: .variants)
    }
    
}


struct Tax : Codable {
    
    let name : String?
    let value : Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
    }
    
}


struct Variant : Codable {
    
    let color : String?
    let id : Int?
    let price : Int?
    let size : Int?
    
    enum CodingKeys: String, CodingKey {
        case color = "color"
        case id = "id"
        case price = "price"
        case size = "size"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
    }
    
}



struct Product : Codable {
    
    let id : Int?
    let shares : Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case shares = "shares"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        shares = try values.decodeIfPresent(Int.self, forKey: .shares)
    }
    
}


struct Ranking : Codable {
    
    let products : [Product]?
    let ranking : String?
    
    enum CodingKeys: String, CodingKey {
        case products = "products"
        case ranking = "ranking"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([Product].self, forKey: .products)
        ranking = try values.decodeIfPresent(String.self, forKey: .ranking)
    }
    
}



struct HeadyModels : Codable {
    
    let categories : [Category]?
    let rankings : [Ranking]?
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
        case rankings = "rankings"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories = try values.decodeIfPresent([Category].self, forKey: .categories)
        rankings = try values.decodeIfPresent([Ranking].self, forKey: .rankings)
    }
    
}

