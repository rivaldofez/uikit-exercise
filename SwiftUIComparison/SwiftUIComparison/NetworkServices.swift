//
//  NetworkServices.swift
//  SwiftUIComparison
//
//  Created by Rivaldo Fernandes on 12/01/23.
//

import Foundation

class NetworkService {
    
    // MARK: Gunakan API Key dalam akun Anda.
    let apiKey = "d63d4fcb8d25c828fe89669f635ff545"
    let language = "en-US"
    let page = "1"
    
    func getMovies() async throws -> [Movie] {
        var components = URLComponents(string: "https://api.themoviedb.org/3/movie/popular")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: language),
            URLQueryItem(name: "page", value: page)
        ]
        let request = URLRequest(url: components.url!)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error: Can't fetching data.")
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(MovieResponses.self, from: data)
        
        return movieMapper(input: result.movies)
    }
}

extension NetworkService {
    fileprivate func movieMapper(
        input movieResponses: [MovieResponse]
    ) -> [Movie] {
        return movieResponses.map { result in
            return Movie(
                idMovie: result.idMovie,
                title: result.title,
                overview: result.overview,
                posterPath: result.posterPath
            )
        }
    }
}
