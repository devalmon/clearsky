//
//  TabBarController.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 07.01.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    let rightBarButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
        
    }
    
    //MARK: - Setup
    private func setupViewControllers() {
        let mainVC      = MainViewController()
        let weatherVC   = WeatherViewController()
        let testVC      = TestViewController()
        let poorVC      = PoorViewController()
        let scanVC      = ScanTableViewController()
        
        let naviScanVC = UINavigationController(rootViewController: scanVC)
        naviScanVC.topViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(rightBarButtonPressed))
        naviScanVC.topViewController?.navigationController?.title = "Scaner"
        
        mainVC.tabBarItem       = UITabBarItem(title: "Main", image: UIImage(systemName: "house.circle"), tag: 0)
        weatherVC.tabBarItem    = UITabBarItem(title: "Weather", image: UIImage(systemName: "moon.circle"), tag: 1)
        testVC.tabBarItem       = UITabBarItem(title: "Test", image: UIImage(systemName: "books.vertical"), tag: 2)
        poorVC.tabBarItem       = UITabBarItem(title: "Poor", image: UIImage(systemName: "eurosign.circle"), tag: 3)
        scanVC.tabBarItem       = UITabBarItem(title: "Scan", image: UIImage(systemName: "bonjour"), tag: 4)
        
        
        let listViewControllers = [weatherVC, testVC, poorVC, naviScanVC]
        viewControllers = listViewControllers.map {$0}
    }
    
    //MARK: - Actions
    @objc func rightBarButtonPressed() {
        print("button pressed")
    }
    

}
