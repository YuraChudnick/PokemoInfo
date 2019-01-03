//
//  GroupModel.swift
//  PokemonInfo
//
//  Created by yura on 11/7/18.
//  Copyright © 2018 TFM. All rights reserved.
//

protocol PokemonGroupModelProtocol {
    
    var group: Int { get }
    
    init(group: Int)
    
    func getGroup() -> EggGroup?
    
    func getPokemons() -> [Pokemon]
    
    func getGroupItemsCount() -> Int
    
    func getGroupItem(at index: Int) -> Pokemon?
    
    func loadGroup(handler: @escaping (Bool) -> Void)
    
    func search(_ text: String)
}
