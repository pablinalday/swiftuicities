
import Foundation

class CitiesManager {
    

    static var instance = CitiesManager()

    private init() {

    }

    func fetchCities(completion: @escaping (Result<[City], Error>) -> Void) {
        let urlString = "https://gist.githubusercontent.com/hernan-uala/dce8843a8edbe0b0018b32e137bc2b3a/raw/0996accf70cb0ca0e16f9a99e0ee185fafca7af1/cities.json"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                print("No data found")
                return
            }
            do {
                let decoder = JSONDecoder()
                var cities = try decoder.decode([City].self, from: data)

                completion(.success(cities.sorted {$0.combinedCity < $1.combinedCity}))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
