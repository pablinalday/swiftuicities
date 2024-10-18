


import Foundation


struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}


struct City: Codable, Identifiable {
    let id: Int
    let countryCode: String
    let cityName: String
    let coordinates: Coordinates?
    var isFav: Bool = false

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case countryCode = "country"
        case cityName = "name"
        case coordinates = "coord"
    }

    var combinedCity: String {
        return "\(cityName), \(countryCode)"
    }

    var combinedCoords: String {
        let lat = String(format: "%.4f", coordinates!.latitude)
        let lon = String(format: "%.4f", coordinates!.longitude)
        return "\(lat), \(lon)"
    }

    init(countryCode: String, cityName: String) {
        self.id = 1
        self.countryCode = countryCode
        self.cityName = cityName
        self.coordinates = Coordinates(latitude: 1.22, longitude: 1.44)
    }
}
