//
//  PokemonDetailVC.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonDetailVC: UIViewController, PokemonDetailViewProtocol {
    
    //MARK: - Properties
    
    var presenter: PokemonDetailPresenterPresenter!
    var abilities: [Ability] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let cellId = "AbilityCell"
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View states
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        presenter.showDetailInfo()
    }
    
    //MARK: - Setup views
    
    fileprivate func setupTableView() {
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    //MARK: - Actions
    
    func setTitle(text: String?) {
        title = text
    }
    
    func setPokemonImage(image: URL?) {
        pokemonImageView.kf.setImage(with: image)
    }
    
    func setAbilities(abilities: [Ability]) {
        self.abilities = abilities
    }

}

//MARK: - Table view

extension PokemonDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AbilityCell
        let ability = abilities[indexPath.row]
        cell.nameLabel.text = ability.ability?.name
        cell.descriptionLabel.text = "Loading..."
        ability.loadAbilitiesDetail(handler: { (success) in
            if success {
                cell.descriptionLabel.text = ability.abilityDetail?.getEffectDescription()
                tableView.reloadRows(at: [indexPath], with: .automatic)
            } else {
                cell.descriptionLabel.text = "No Data"
            }
        })
        let abilityName = ability.ability?.name ?? "no_ability"
        presenter.showAbilityRate(for: abilityName, result: { (rate) in
            cell.rateView.rating = rate
        })
        cell.rateView.didFinishTouchingCosmos = { [weak self] (rate) in
            self?.presenter.ratingChanged(rate: rate, for: abilityName)
        }
        return cell
    }
    
}
