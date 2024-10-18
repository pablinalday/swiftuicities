

import Foundation


protocol CityListPresenterProtocol {
    func updateCityList(cities: [City])
}

class CityListPresenter {
    var view: CityListView!
}

extension CityListPresenter: CityListPresenterProtocol {
    func updateCityList(cities: [City]) {
        view.updateCityList(cities: cities)
    }
    

}
