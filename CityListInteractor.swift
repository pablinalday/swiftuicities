
import Foundation

protocol CityListInteractorProtocol {
    func fetchCities()
}

class CityListInteractor {
    var presenter: CityListPresenterProtocol!
}

extension CityListInteractor: CityListInteractorProtocol {
    func fetchCities() {
        CitiesManager.instance.fetchCities { result in
            switch result {
            case .success(let cities):
                self.presenter.updateCityList(cities: cities)
            case .failure(let error):
                print("Error descargando las ciudades: \(error)")
            }
        }
    }
}


