//
//  WeatherViewController.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 12.11.2020.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let backgroundView = UIImageView()
    let locationButton = UIButton()
    let findButton = UIButton()
    let searchField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension WeatherViewController {
    func style() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: .backGroundName)
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.alpha = 0.75
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: .locationSignName), for: .normal)
        locationButton.tintColor = .label
        
        findButton.translatesAutoresizingMaskIntoConstraints = false
        findButton.setBackgroundImage(UIImage(systemName: .findButtonName), for: .normal)
        findButton.tintColor = .label
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
//        searchField.font = UIFont(name: "Avenir Next", size: 25)
        searchField.placeholder = "Search"
        searchField.textAlignment = .left
        searchField.borderStyle = .roundedRect
        searchField.backgroundColor = .systemFill
    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(locationButton)
        view.addSubview(findButton)
        view.addSubview(searchField)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            
            locationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            locationButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            
            findButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: findButton.trailingAnchor, multiplier: 1),
            findButton.widthAnchor.constraint(equalToConstant: 40),
            findButton.heightAnchor.constraint(equalToConstant: 40),
            
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchField.leadingAnchor.constraint(equalTo: locationButton.trailingAnchor, constant: 5),
            searchField.trailingAnchor.constraint(equalTo: findButton.leadingAnchor, constant: -5)
            
        ])
    }
}

extension String {
    public static let backGroundName = "background"
    public static let locationSignName = "location.fill.viewfinder"
    public static let findButtonName = "magnifyingglass.circle"
}
