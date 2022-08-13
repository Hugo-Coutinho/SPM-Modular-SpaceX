//
//  BaseRequest.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public class BaseRequest: BaseRequestInput {
    
    // MARK: - INIT -
    public init() {}
    
    // MARK: - EXPOSED METHODS -
    public func doRequest(urlString: String, completionHandler: @escaping (Data?) -> Void) {
        guard let urlComponents = URLComponents(string: urlString),
              let url = urlComponents.url else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200,
                  let data = data,
                  error == nil
            else { completionHandler(nil); return }
            completionHandler(data)
        }.resume()
    }
}

