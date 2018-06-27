//
//  ViewController.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import UIKit

fileprivate enum CellIdentifier: String {
    case SWCharCell = "SWCharCell"
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = SWViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.customInitSWPerson { (finished) in
            DispatchQueue.main.async {
                if finished {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.people != nil {
            return viewModel.people.count
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.SWCharCell.rawValue)
            as? SWCharCell else { return UITableViewCell() }
        
        if viewModel.people != nil {
            cell.customInit(withSWPerson: viewModel.people[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}

