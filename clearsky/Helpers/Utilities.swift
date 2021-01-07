//
//  Utilities.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 01.01.2021.
//

import UIKit

//MARK: - UIColor with hex value
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

//MARK: - String constants
extension String {
    public static let backGroundName = "background"
    public static let locationSignName = "location.fill.viewfinder"
    public static let findButtonName = "magnifyingglass.circle"
    public static let conditionImageName = "sun.max"
    public static let customUrlString = "https://community-open-weather-map.p.rapidapi.com/weather?q=Moscow%2Cru&lat=0&lon=0&callback=test&id=2172797&lang=null&units=%22metric%22%20or%20%22imperial%22&mode=xml%2C%20html"
    public static let darkUrlString = "https://api.darksky.net/forecast/95ff3388196947b96d36822769f7710d/55.7558,37.6173?units=si"
}
