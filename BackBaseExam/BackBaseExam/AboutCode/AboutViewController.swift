//
//  AboutViewController.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 09/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import UIKit

// MARK: - AboutViewController implementation

final class AboutViewController : UITableViewController {
    typealias CityInfoField = (name: String, keyPath: KeyPath<CityInfoData, String>)
    
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    let fields: [CityInfoField] = [
        (name: "City", keyPath: \CityInfoData.name),
        (name: "Country Code", keyPath: \CityInfoData.country),
        (name: "Coordinates", keyPath: \CityInfoData.coord),
    ]
    
    var presenter: AboutPresenter? {
        didSet {
            presenter?.loadAboutInfo()
        }
    }
    var aboutInfo: CityInfoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        
        self.navigationItem.titleView = self.activityIndicatorView
        self.activityIndicatorView.hidesWhenStopped = true
    }
    
    // MARK: - UITableViewDataSource methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let aboutInfo = self.aboutInfo else { return UITableViewCell() }
        
        let field = self.fields[indexPath.row]
        let cell: UITableViewCell
        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "AboutInfoCell") {
            cell = dequeuedCell
        } else {
            cell = UITableViewCell(style: .value2, reuseIdentifier: "AboutInfoCell")
            cell.selectionStyle = .none
        }
        
        cell.textLabel?.text = field.name
        let value = aboutInfo[keyPath: field.keyPath]
        cell.detailTextLabel?.text = value
        
        return cell
    }
}

// MARK: - AboutView protocol methods

extension AboutViewController: AboutView {
    func configure(with aboutInfo: CityInfoData) {
        self.aboutInfo = aboutInfo
        self.tableView.reloadData()
    }
    
    func display(error: ModelError) {
        let alertController = UIAlertController(title: "Error",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setActivityIndicator(hidden: Bool) {
        if hidden {
            self.activityIndicatorView.stopAnimating()
        } else {
            self.activityIndicatorView.startAnimating()
        }
    }
}
