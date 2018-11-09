//
//  PokemonGroupVC.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import UIKit

class PokemonGroupVC: UIViewController, PokemonGroupView {

    var presenter: PokemonGroupViewPresenter!
    
    class func createModule(group: Int) -> PokemonGroupVC {
        let model = PokemonGroupModel(group: group)
        let view = PokemonGroupVC(nibName: "PokemonGroupVC", bundle: nil)
        let presenter = PokemonGroupPresenter(view: view, groupDataModel: model)
        view.presenter = presenter
        return view
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarTopConstraint: NSLayoutConstraint!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate var numberOfCellsPerRow: CGFloat = 4 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let minimumLineSpacingForSection: CGFloat = 10
    let insetForSection: CGFloat = 10
    let contentOffset = "contentOffset"
    var searchBarYPosition: CGFloat = 0
    var isSearchBarEditing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupSegmentedControl()
        addCollectionViewObserver()
        
        presenter.loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tabBarController?.tabBar.isTranslucent = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        tabBarController?.tabBar.isTranslucent = false
    }
    
    fileprivate func setupViews() {
        let groupPresenter = presenter as! PokemonGroupPresenter
        collectionView.delegate = self
        collectionView.dataSource = groupPresenter
        collectionView.register(UINib(nibName: groupPresenter.cellId, bundle: nil), forCellWithReuseIdentifier: groupPresenter.cellId)
        
        searchBarTopConstraint.constant = 0
        searchBar.delegate = self
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    fileprivate func setupSegmentedControl() {
        let segmentControl = UISegmentedControl(items: ["1 item", "2 items", "3 items", "4 items"])
        segmentControl.selectedSegmentIndex = 3
        navigationItem.titleView = segmentControl
        segmentControl.addTarget(self, action: #selector(changeNumberOfCellsPerRow(_:)), for: .valueChanged)
    }
    
    @objc fileprivate func changeNumberOfCellsPerRow(_ sender: UISegmentedControl) {
        numberOfCellsPerRow = CGFloat(sender.selectedSegmentIndex + 1)
    }
    
    fileprivate func addCollectionViewObserver() {
        collectionView.addObserver(self, forKeyPath: contentOffset, options: [.new, .old], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let kPath = keyPath,  kPath == contentOffset, let collectionView = object as? UICollectionView {
            searchBarYPosition = -1 * collectionView.contentOffset.y
            if isSearchBarActive() { return }
            searchBarTopConstraint.constant = searchBarYPosition
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func setTabBarTitle(title: String) {
        tabBarItem.title = title
    }

    func showDetailView(detailView: UIViewController) {
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    deinit {
        collectionView.removeObserver(self, forKeyPath: contentOffset)
    }
    
}

extension PokemonGroupVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - numberOfCellsPerRow * minimumLineSpacingForSection - insetForSection * 2 - Utils.getSaveAreaLeftRightPadding()) / numberOfCellsPerRow
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: searchBar.frame.height + insetForSection, left: insetForSection, bottom: insetForSection, right: insetForSection)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.showDetailInfo(at: indexPath.row)
    }
}

extension PokemonGroupVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.search(searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        searchBarTopConstraint.constant = searchBarYPosition
        searchBar.backgroundColor = .clear
        
        presenter.search(searchBar.text ?? "")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        isSearchBarEditing = true
        searchBar.backgroundColor = .white
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        isSearchBarEditing = false
        if searchBar.text?.isEmpty ?? true {
            searchBarTopConstraint.constant = searchBarYPosition
            searchBar.backgroundColor = .clear
        }
    }
    
    func isSearchBarActive() -> Bool {
        return isSearchBarEditing || !(searchBar.text?.isEmpty ?? true)
    }
    
}
