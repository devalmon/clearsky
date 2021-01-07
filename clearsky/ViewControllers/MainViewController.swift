//
//  MainViewController.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 20.12.2020.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com/v1/prices/direct/?destination=LED&origin=MOW"
        let baseURL = URL(string: urlString)
        guard let url = baseURL else { return }
        
        let dt = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error")
            } else {
                print(data ?? "")
            }
        }
        dt.resume()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
