//
//  TabBarController.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabBarList: [UIViewController] = []
        
        for i in 1...4 {
            let group = PokemonGroupModuleBuilder().create(with: i)
            group.tabBarItem = UITabBarItem(title: "Group\(i)", image: UIImage(named: "ic_egg"), tag: i)
            tabBarList.append(UINavigationController(rootViewController: group))
        }
        
        viewControllers = tabBarList
    }

}
