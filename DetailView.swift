

import SwiftUI
import MapKit


protocol DetailViewProtocol {

}

struct DetailView: View {
     var city: City
    var interactor: DetailViewInteractor!

    @State private var region: MKCoordinateRegion

    init(city: City) {
        self.city = city
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: city.coordinates!.latitude, longitude: city.coordinates!.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Define el nivel de zoom
        ))
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [city]) { city in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: city.coordinates!.latitude, longitude: city.coordinates!.longitude)) {
                VStack {
                    Image(systemName: "mappin")
                        .foregroundColor(.red)
                        .font(.title)
                    Text(city.cityName)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

extension DetailView: DetailViewProtocol {
    
 
}


