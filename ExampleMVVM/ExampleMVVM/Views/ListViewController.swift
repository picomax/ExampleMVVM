//
//  ListViewController.swift
//  ExampleMVVM
//
//  Created by hooni on 4/1/22.
//

import UIKit

enum IdentifierType: String {
    case headerview
    case generalbody
    case pickerview
}

class CustomTableViewCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = bounds.size;
        imageView?.frame = CGRect(x: 20, y: 5, width: 42, height: 34)
        textLabel?.frame = CGRect(x: 70, y: 0, width: 100, height: size.height);
        
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        self.layoutMargins = .zero
    }
}

class ListViewController: BaseViewController {

    var filteredData: [TeamModel] = []
    var tableView = UITableView()
    var isSearch: Bool = false
    let viewModel: ListViewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.title = "World Cup Groups"
        setupUI()
    }
    
    private func setupUI() {
        tableView = UITableView(frame: view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: IdentifierType.generalbody.rawValue)
        //tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        view.addSubview(tableView)
        
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Search Team"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        
        if #available(iOS 11, *) {
            tableView.separatorInsetReference = .fromAutomaticInsets
        }
    }
    
    override func rotated() {
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rotated()
    }
}

extension ListViewController: UISearchBarDelegate{
    //MARK: UISearchbar delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = (filteredData.count > 0)
    }
       
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = (filteredData.count > 0)
    }
       
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
        filteredData.removeAll()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = (filteredData.count > 0)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            isSearch = false
            filteredData.removeAll()
        } else {
            filteredData = viewModel.getTotalItems().filter({ (team) -> Bool in
                guard let name = team.name else { return false }
                return name.lowercased().starts(with: searchText.lowercased())
            })
            isSearch = true
        }
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return filteredData.count
        }
        return viewModel.getItemCount(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierType.generalbody.rawValue, for: indexPath)
        let item = isSearch ? filteredData[indexPath.row] : viewModel.getItem(indexPath: indexPath)
        
        cell.textLabel?.text = item.name
        if let flagUrl = item.flag {
            cell.imageView?.loadFrom(urlSting: flagUrl, placeHolder: UIImage(named: "blank"))
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearch {
            return 1
        }
        return viewModel.getSectionCount()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearch {
            return "Search Results"
        }
        return viewModel.getSectionTitle(index: section)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.black
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamModel = isSearch ? filteredData[indexPath.row] : viewModel.getItem(indexPath: indexPath)
        let detailViewController = DetailViewController(viewModel: DetailViewModel(model: teamModel))
        navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
