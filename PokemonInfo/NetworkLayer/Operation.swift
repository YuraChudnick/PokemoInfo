//
//  Operation.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Foundation

protocol Operation  {
    
    var request: Request { get }
    
    func execute(completitionHandler: @escaping (Response) -> Void)
    
}
