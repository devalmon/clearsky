//
//  TestViewController.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 26.12.2020.
//

import UIKit

class TestViewController: UIViewController {
    
    let datePicker = UIDatePicker()
    let printNumberButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupDatePicker()
        setupPrintNumberButton()
        
    }
    
    //MARK: - Setup Func
    private func setupPrintNumberButton() {
        printNumberButton.setTitle("print number", for: .normal)
        printNumberButton.setTitleColor(UIColor.systemIndigo, for: .normal)
        view.addSubview(printNumberButton)
        printNumberButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            printNumberButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            printNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
//        printNumberButton.addTarget(self, action: #selector(hiLoadFunc), for: .touchUpInside)
    }
    
    private func setupVC() {
        view.backgroundColor = UIColor.white
    }
    private func setupDatePicker() {
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: - hiload func
    @objc private func hiLoadFunc() {
        
        DispatchQueue.global(qos: .background).async {
            for i in 0 ... 10_000_000 {
                print(i)
            }
        }
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
