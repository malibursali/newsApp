//
//  URLBuilder.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 7.05.2021.
//

import Foundation

public class URLBuilder {
    static let sharedInstance = URLBuilder()
    
    func buildUrl(path: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = BASE_URL
        urlComponents.path = path
        
        return urlComponents.url
    }
    
    func buildUrl(path: String, params: [String: String]) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = BASE_URL
        urlComponents.path = path
        urlComponents.queryItems = self.buildQueryItems(params)
        
        return urlComponents.url
    }
    
    func buildQueryItems(_ params: [String: String]) -> [URLQueryItem] {
        return params.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
