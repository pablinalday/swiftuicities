

import SwiftUI

protocol cityListViewProtocol {
    func updateCityList(cities: [City])
}

struct CityListView: View {
    @ObservedObject var model = CitiesViewModel()
    @State private var searchText = ""
    var interactor: CityListInteractor!

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(filteredCities, id: \.id) { city in
                        ZStack {
                            NavigationLink(destination: configureView(city: city)) {
                                EmptyView()
                            }
                            CityView(city: city)
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar")

        }.onAppear() {
            interactor?.fetchCities()
        }
    }

    var filteredCities: [City] {
        if searchText.isEmpty {
            return model.cityArray
        } else {
            return model.cityArray.filter { city in
                city.combinedCity.hasPrefix(searchText)
            }
        }
    }

    func configureView(city: City) -> some View {
        var view = DetailView(city: city)

        let presenter = DetailViewPresenter()
        presenter.view = view
        let interactor = DetailViewInteractor()
        interactor.presenter = presenter
        view.interactor = interactor
        return view
    }

}

struct CityView: View {
    var city: City!

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city.combinedCity)
                Text(city.combinedCoords)
            }
            Spacer()

            Image(systemName: city.isFav ? "staroflife.circle.fill" : "staroflife.circle")
                .onTapGesture { addCityToFav()}
        }
    }

    func addCityToFav() {

    }
}

extension CityListView: cityListViewProtocol {
    func updateCityList(cities: [City]) {
        model.cityArray = cities

    }
}

class CitiesViewModel: ObservableObject {
    @Published var cityArray = [City]()
}
