//
//  WeatherViewController.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 12.11.2020.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let backgroundView = UIImageView()
    let rootStackView = UIStackView()
    let searchStackView = UIStackView()
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
        
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.alignment = .leading
        rootStackView.axis = .vertical
        rootStackView.spacing = 10
        
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.spacing = 8
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: .locationSignName), for: .normal)
        locationButton.tintColor = .label
        
        findButton.translatesAutoresizingMaskIntoConstraints = false
        findButton.setBackgroundImage(UIImage(systemName: .findButtonName), for: .normal)
        findButton.tintColor = .label
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        searchField.textColor = UIColor.systemFill
        searchField.placeholder = "Search"
        searchField.textAlignment = .right
        searchField.borderStyle = .roundedRect
        searchField.backgroundColor = .systemFill
        
    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(searchStackView)
        
        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchField)
        searchStackView.addArrangedSubview(findButton)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: rootStackView.trailingAnchor, multiplier: 1),
            searchStackView.widthAnchor.constraint(equalTo: rootStackView.widthAnchor),
            
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            
            findButton.widthAnchor.constraint(equalToConstant: 40),
            findButton.heightAnchor.constraint(equalToConstant: 40),
            rootStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: findButton.trailingAnchor, multiplier: 1)
            
        ])
    }
}

extension String {
    public static let backGroundName = "background"
    public static let locationSignName = "location.fill.viewfinder"
    public static let findButtonName = "magnifyingglass.circle"
}
