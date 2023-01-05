import UIKit

// MARK: Gunakan API Key dalam akun Anda.
let apiKey = ""
let language = "en-US"
let page = "1"

struct MovieResponses: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

func decodeJSON(from data: Data) {
    let decoder = JSONDecoder()
    
    if let movies = try? decoder.decode(
        MovieResponses.self,
        from: data
    ) as MovieResponses {
        print("PAGE: \(movies.page)")
        print("TOTAL RESULTS: \(movies.totalResults)")
        print("TOTAL PAGES: \(movies.totalPages)")
    } else {
        print("ERROR: Can't Decode JSON")
    }
}

var components = URLComponents(string: "https://api.themoviedb.org/3/movie/popular")!

components.queryItems = [
    URLQueryItem(name: "api_key", value: apiKey),
    URLQueryItem(name: "language", value: language),
    URLQueryItem(name: "page", value: page)
]

let request = URLRequest(url: components.url!)

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let response = response as? HTTPURLResponse else { return }
    
    if let data = data {
        if response.statusCode == 200 {
            print("DATA: \(data)")
            decodeJSON(from: data)
        } else {
            print("ERROR: \(data), HTTPS Status: \(response.statusCode)")
        }
    }
}

task.resume()


