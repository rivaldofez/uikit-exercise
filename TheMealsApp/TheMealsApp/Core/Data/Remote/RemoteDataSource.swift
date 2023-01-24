//
//  RemoteDataSource.swift
//  TheMealsApp
//
//  Created by Gilang Ramadhan on 22/11/22.
//

import Foundation
import Alamofire

protocol RemoteDataSourceProtocol: AnyObject {
    
    func getCategories(result: @escaping (Result<[CategoryResponse], URLError>) -> Void)
    
}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
    
}

//extension RemoteDataSource: RemoteDataSourceProtocol {
//
//  func getCategories(
//    result: @escaping (Result<[CategoryResponse], URLError>) -> Void
//  ) {
//    guard let url = URL(string: Endpoints.Gets.categories.url) else { return }
//
//    let task = URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, maybeError in
//      if maybeError != nil {
//        result(.failure(.addressUnreachable(url)))
//      } else if let data = maybeData, let response = maybeResponse as? HTTPURLResponse, response.statusCode == 200 {
//        let decoder = JSONDecoder()
//        do {
//          let categories = try decoder.decode(CategoriesResponse.self, from: data).categories
//          result(.success(categories))
//        } catch {
//          result(.failure(.invalidResponse))
//        }
//      }
//    }
//    task.resume()
//
//  }
//
//}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getCategories(
        result: @escaping (Result<[CategoryResponse], URLError>) -> Void
    ) {
        guard let url = URL(string: Endpoints.Gets.categories.url) else { return }
        
        AF.request(url).validate().responseDecodable(of: CategoriesResponse.self) { response in
            switch response.result {
            case .success(let value):
                result(.success(value.categories))
            case .failure:
                result(.failure(.invalidResponse))
            }
        }
    }
}
