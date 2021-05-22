//
//  NetworkService.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 7.05.2021.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    func getNews(_ country: String, _ tag: String, completion: @escaping (_ response: NewsResponse) -> Void) {
        do {
            let params = ["country": country, "tag": tag]
            guard let url = URLBuilder.sharedInstance.buildUrl(path: GET_NEWS_URL, params: params) else { return }
            let headers = HTTPHeaders(["Content-Type": "application/json", "Authorization": API_KEY])
            let urlRequest = try URLRequest(url: url, method: .get, headers: headers)
            
            AF.request(urlRequest).responseDecodable(of: NewsResponse.self) { response in
                switch response.result {
                case .success(let newsResponse):
                    completion(newsResponse)
                case .failure(let error):
                    print(error)
                    completion(NewsResponse(news: [], success: false))
                }
            }
        } catch {
            print(error)
        }
    }
}
