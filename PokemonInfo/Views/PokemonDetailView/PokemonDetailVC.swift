//
//  PokemonDetailVC.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonDetailVC: UIViewController, PokemonDetailView {
    
    var presenter: PokemonDetailViewPresenter!
    
    class func createModule(pokemon: Pokemon) -> PokemonDetailVC {
        let model = PokemonDetailModel()
        model.pokemonInfo = pokemon
        let view = PokemonDetailVC(nibName: "PokemonDetailVC", bundle: nil)
        let presenter = PokemonDetailPresenter(view: view, detailModel: model)
        view.presenter = presenter
        view.hidesBottomBarWhenPushed = true
        return view
    }
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        presenter.showDetailInfo()
    }
    
    fileprivate func setupTableView() {
        let detailPresenter = presenter as! PokemonDetailPresenter
        
        tableView.delegate = self
        tableView.dataSource = detailPresenter
        tableView.separatorInset = .zero
        tableView.register(UINib(nibName: detailPresenter.cellId, bundle: nil), forCellReuseIdentifier: detailPresenter.cellId)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func setTitle(text: String?) {
        title = text
    }
    
    func setPokemonImage(image: URL?) {
        pokemonImageView.kf.setImage(with: image)
    }

}

extension PokemonDetailVC: UITableViewDelegate {
    
    
    
}
