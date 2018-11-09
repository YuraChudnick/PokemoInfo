//
//  SimpleRequest.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Foundation

struct SimpleRequest: Request {
    
    let baseUrl: String
    
    init(url: String) {
        baseUrl = url
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(15)
        return request
    }
}
