//
//  MealRepository.swift
//  TheMealsApp
//
//  Created by Gilang Ramadhan on 22/11/22.
//

import RxSwift

protocol MealRepositoryProtocol {
    func getCategories() -> Observable<[CategoryModel]>
}
//
//final class MealRepository: NSObject {
//
//  typealias MealInstance = (RemoteDataSource) -> MealRepository
//
//  fileprivate let remote: RemoteDataSource
//
//  private init(remote: RemoteDataSource) {
//    self.remote = remote
//  }
//
//  static let sharedInstance: MealInstance = { remoteRepo in
//    return MealRepository(remote: remoteRepo)
//  }
//
//}

final class MealRepository: NSObject {
    
    typealias MealInstance = (LocaleDataSource, RemoteDataSource) -> MealRepository
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
        self.remote = remote
        self.locale = locale
    }
    static let sharedInstance: MealInstance = { localeRepo, remoteRepo in
        return MealRepository(locale: localeRepo, remote: remoteRepo)
    }
    
}



extension MealRepository: MealRepositoryProtocol {
    
    //    func getCategories(
    //        result: @escaping (Result<[CategoryModel], Error>) -> Void
    //    ) {
    //
    //        self.remote.getCategories { remoteResponses in
    //            switch remoteResponses {
    //            case .success(let categoryResponses):
    //                let resultList = CategoryMapper.mapCategoryResponsesToDomains(input: categoryResponses)
    //                result(.success(resultList))
    //            case .failure(let error):
    //                result(.failure(error))
    //            }
    //        }
    //    }
    
    func getCategories() -> Observable<[CategoryModel]> {
        return self.locale.getCategories()
            .map { CategoryMapper.mapCategoryEntitiesToDomains(input: $0) }
            .filter { !$0.isEmpty }
            .ifEmpty(switchTo: self.remote.getCategories()
                .map { CategoryMapper.mapCategoryResponsesToEntities(input: $0) }
                .flatMap { self.locale.addCategories(from: $0) }
                .filter { $0 }
                .flatMap { _ in self.locale.getCategories()
                        .map { CategoryMapper.mapCategoryEntitiesToDomains(input: $0) }
                }
            )
    }
    
    
}
