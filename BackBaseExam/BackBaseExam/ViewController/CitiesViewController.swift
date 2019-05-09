//
//  CitiesViewController.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 04/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import UIKit

public class CititesViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var citySearchBar: UISearchBar!
    @IBOutlet weak var citiesTable: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private let viewModel = CitiesViewModel.sharedInstance
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search"
        self.citySearchBar.delegate = self
        self.citiesTable.delegate = self
        self.citiesTable.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(viewModelUpdate(notification:)), name: Notification.Name("citiesUpdated"), object: nil)
        
        if ((viewModel?.cities.isEmpty)!) {
            self.activityIndicatorView(show: true)
            viewModel?.load(completion: { (success:Bool) in
                if (success) {
                    DispatchQueue.main.async {
                        // Reload table view data
                        self.citiesTable.reloadData()
                        self.activityIndicatorView(show: false)
                    }
                }
            })
        }
    }
    
    func activityIndicatorView(show:Bool) {
        if (show) {
            self.activityIndicatorView.startAnimating()
            self.view.addSubview(self.activityIndicatorView)
        }
        else {
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.removeFromSuperview()
        }
    }
    
    
    // MARK: - ViewModel callback
    @objc func viewModelUpdate(notification:Notification) {
        DispatchQueue.main.async {
            // Reload table view data
            self.citiesTable.reloadData()
        }
    }
    
    
    // MARK: - Table view datasource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cities.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cityCell:CityCell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as! CityCell
        
        if (indexPath.row < viewModel?.cities.count ?? 0) {
            let city:City = (viewModel?.cities[indexPath.row])!
            
            // Set the necessary info in the cell
            cityCell.cityNameLabel.text = "\(city.name!) - \(city.country!)"
            cityCell.coordLabel.text = "Lat: \(city.coord!.lat!), Lon: \(city.coord!.lon!)"
            
            // Add the index for this cell for reference when about button is clicked.
            cityCell.index = indexPath.row
            cityCell.action = {(index:Int)->Void in
                // Display the about screen
                let aboutVC = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "about") as! AboutViewController
                aboutVC.city = self.viewModel?.cities[index]
                self.navigationController?.pushViewController(aboutVC, animated: true)
            }
        }
        
        return cityCell
    }
    
    
    // MARK: - Table view delegate
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let city = self.viewModel?.cities[indexPath.row],
            let mapVC = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "map") else {
            print("No city exists")
            return
        }
        // Remove highlight
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
        
        self.viewModel?.selectedCity = city
        // Only push on portrait mode
        if (UIDevice.current.orientation == .portrait) {
            self.navigationController?.pushViewController(mapVC, animated: true)
        }
    }
    
    
    // MARK: - Search bar delegate
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.viewModel?.searchEntry = searchText
        }
    }
}
