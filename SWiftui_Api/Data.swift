//
//  Data.swift
//  SWiftui_Api
//
//  Created by Adsum MAC 2 on 05/07/21.
//

import SwiftUI
import Foundation

struct Post : Codable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        body = try values.decodeIfPresent(String.self, forKey: .body)
    }

}


class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
            print(posts)
        }
        .resume()
    }
    
    func getselectedPosts(ids:Int,completion: @escaping (selectedPost) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(ids)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let selectposts = try! JSONDecoder().decode(selectedPost.self, from: data!)
            DispatchQueue.main.async {
                completion(selectposts)
            }
            print(selectposts)
        }
        .resume()
    }
}
