//
//  WeatherViewController.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 12.11.2020.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    let backgroundView      = UIImageView()
    let rootStackView       = UIStackView()
    let searchStackView     = UIStackView()
    let locationButton      = UIButton()
    let findButton          = UIButton()
    let searchField         = UITextField()
    let conditionImageView  = UIImageView()
    let temperatureLabel    = UILabel()
    let cityLabel           = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
        DispatchQueue.main.async {
            self.searchField.becomeFirstResponder()
        }
        

        
//        MARK: - URLSESSION
        
//        let headers = [
//            "x-rapidapi-key": "crxld6lmVBmshJhJm3r9KVGEXfW9p1Yyre2jsneBeJP3h94ilL",
//            "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com"
//        ]

        let request = NSMutableURLRequest(url: NSURL(string: .darkUrlString)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers

        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error ?? "ERROR")
            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
//                print(String(data: data, encoding: UTF8))
                
                guard let dataResponse = data,
                          error == nil else {
                          print(error?.localizedDescription ?? "Response Error")
                          return }
                    do{
                        //here dataResponse received from a network request
                        let jsonResponse = try JSONSerialization.jsonObject(with:
                                               dataResponse, options: [])
                        print(jsonResponse) //Response result
                        
                        let jsonDecoder = JSONDecoder()
                
                            let parsedJSON = try jsonDecoder.decode(Weather.self, from: dataResponse)
                            DispatchQueue.main.async {
                                self.temperatureLabel.text = String(parsedJSON.currently.temperature)
                            }
                        
                        
                        
                     } catch let parsingError {
                        print("Error", parsingError)
                   }
            
                
            }
        })

//        dataTask.resume()
        
    }
    
//    MARK: - LOCATION
    let locationManager = CLLocationManager()
    
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
        searchField.autocapitalizationType = .words
        searchField.delegate = self
        searchField.addTarget(self, action: #selector(actionTextChanged(sender:)), for: .editingChanged)
        searchField.isUserInteractionEnabled = true
        
        conditionImageView.translatesAutoresizingMaskIntoConstraints = false
        conditionImageView.image = UIImage(systemName: .conditionImageName)
        conditionImageView.tintColor = UIColor.black
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.font = UIFont.systemFont(ofSize: 80)
//        temperatureLabel.text = "24.8°C"
        temperatureLabel.text = ""
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: 50)
        cityLabel.text = "Moscow"
        
    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(searchStackView)
        rootStackView.addArrangedSubview(conditionImageView)
        rootStackView.addArrangedSubview(temperatureLabel)
        rootStackView.addArrangedSubview(cityLabel
        )
        
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
            
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            
            findButton.widthAnchor.constraint(equalToConstant: 40),
            findButton.heightAnchor.constraint(equalToConstant: 40),
            rootStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: findButton.trailingAnchor, multiplier: 1),
            
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
            conditionImageView.heightAnchor.constraint(equalToConstant: 120),
            
            
//            temperatureLabel.widthAnchor.constraint(equalToConstant: 120),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 120),
            
//            cityLabel.widthAnchor.constraint(equalToConstant: 120),
            cityLabel.heightAnchor.constraint(equalToConstant: 120),
            
        ])
    }
}


extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //TODO: create
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //TODO: create
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        //TODO: create
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
       return true
    }

     public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
       //input text
//       let searchText  = textField.text! + string
      //add matching text to arrya
//       searchArrRes = self.originalArr.filter({(($0["name"] as! String).localizedCaseInsensitiveContains(searchText))})
//
//      if(searchArrRes.count == 0){
//        searching = false
//      }else{
//        searching = true
//     }
//      self.tableView.reloadData();

      return true
    }
    
}

//MARK: - Actions
extension WeatherViewController {
    @objc private func actionTextChanged(sender: UITextField) {
        //TODO: create
    }
}
