//
//  PokemonRequest.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Alamofire

enum PokemonRequest: Request {
    
    case allPages
    case with(limit: Int, offset: Int)
    case group(number: Int)
    case pokemon(id: String)
    
    var baseUrl: String {
        return Constants.Urls.pokemonApi
    }
    
    var path: String {
        switch self {
        case .pokemon(let id):
            return "/api/v2/pokemon/" + id + "/"
        case .group(let number):
            return "/api/v2/egg-group/\(number)/"
        case .allPages, .with:
            return "/api/v2/pokemon/"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .allPages, .group, .pokemon:
            return [:]
        case .with(let limit, let offset):
            return ["limit": limit, "offset": offset]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(20)
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
