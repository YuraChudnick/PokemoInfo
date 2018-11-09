//
//  PokemonGroupView.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import UIKit

protocol PokemonGroupView: class {
    
    func reloadData()
    
    func setTabBarTitle(title: String)
    
    func showDetailView(detailView: UIViewController)
    
    func stopActivityIndicator()
    
}
