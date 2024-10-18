
import SwiftUI

struct ContentView: View {
    var body: some View {
        setupView()
    }

    func setupView() -> some View {
        var view = CityListView()
        let presenter = CityListPresenter()
        presenter.view = view
        let interactor = CityListInteractor()
        interactor.presenter = presenter

        view.interactor = interactor

        return view
    }
}


