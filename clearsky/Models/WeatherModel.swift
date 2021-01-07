//
//  WeatherModel.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 18.11.2020.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: Currently
    let minutely: Minutely
    let hourly: Hourly
    let daily: Daily
    let flags: Flags
    let offset: Int
}

// MARK: - Currently
struct Currently: Codable {
    let time: Int
    let summary: Summary
    let icon: Icon
    let nearestStormDistance, nearestStormBearing: Int?
    let precipIntensity: Double
    let precipIntensityError: Double?
    let precipProbability: Double
    let precipType: Icon?
    let temperature, apparentTemperature, dewPoint, humidity: Double
    let pressure, windSpeed, windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex: Int
    let visibility, ozone: Double
}

enum Icon: String, Codable {
    case clearNight = "clear-night"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case rain = "rain"
}

enum Summary: String, Codable {
    case clear = "Clear"
    case lightRain = "Light Rain"
    case mostlyCloudy = "Mostly Cloudy"
    case partlyCloudy = "Partly Cloudy"
    case possibleDrizzle = "Possible Drizzle"
    case possibleLightRain = "Possible Light Rain"
    case rain = "Rain"
}

// MARK: - Daily
struct Daily: Codable {
    let summary: String
    let icon: Icon
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int
    let summary, icon: String
    let sunriseTime, sunsetTime: Int
    let moonPhase, precipIntensity, precipIntensityMax: Double
    let precipIntensityMaxTime: Int
    let precipProbability: Double
    let precipType: Icon?
    let temperatureHigh: Double
    let temperatureHighTime: Int
    let temperatureLow: Double
    let temperatureLowTime: Int
    let apparentTemperatureHigh: Double
    let apparentTemperatureHighTime: Int
    let apparentTemperatureLow: Double
    let apparentTemperatureLowTime: Int
    let dewPoint, humidity, pressure, windSpeed: Double
    let windGust: Double
    let windGustTime, windBearing: Int
    let cloudCover: Double
    let uvIndex, uvIndexTime: Int
    let visibility, ozone, temperatureMin: Double
    let temperatureMinTime: Int
    let temperatureMax: Double
    let temperatureMaxTime: Int
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: Int
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: Int
}

// MARK: - Flags
struct Flags: Codable {
    let sources: [String]
    let nearestStation: Double
    let units: String

    enum CodingKeys: String, CodingKey {
        case sources
        case nearestStation = "nearest-station"
        case units
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let summary: String
    let icon: Icon
    let data: [Currently]
}

// MARK: - Minutely
struct Minutely: Codable {
    let summary: String
    let icon: Icon
    let data: [MinutelyDatum]
}

// MARK: - MinutelyDatum
struct MinutelyDatum: Codable {
    let time: Int
    let precipIntensity, precipIntensityError, precipProbability: Double
    let precipType: Icon
}
