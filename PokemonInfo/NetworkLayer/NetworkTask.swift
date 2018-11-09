//
//  NetworkTask.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class NetworkTask<T: Mappable>: Operation {
    
    let request: Request
    
    init(request: Request) {
        self.request = request
    }
    
    func execute(completitionHandler: @escaping (Response) -> Void) {
        Alamofire.request(request).responseObject { (response: DataResponse<T>) in
            completitionHandler(.init((r: response.response, data: response.result.value, error: response.result.error)))
        }
    }
    
}
