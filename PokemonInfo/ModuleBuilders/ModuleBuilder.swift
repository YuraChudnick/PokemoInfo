//
//  ModuleBuilder.swift
//  PokemonInfo
//
//  Created by Yurii Chudnovets on 1/3/19.
//  Copyright © 2019 TFM. All rights reserved.
//

import UIKit

@objc protocol ModuleBuilder {
    
    @objc optional func create() -> UIViewController
    
    @objc optional func create(with data: Any) -> UIViewController
}
