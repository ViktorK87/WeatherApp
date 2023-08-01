import SnapKit
import CoreLocation

final class FirstScreenModel: NSObject {
    var currentCity = (name: "Текущее место", longitude: 0.0, latitude: 0.0)
    let locationManager = CLLocationManager()

    func loadLocation(){
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
     func loadWeather(for lat: Double,
                     _ lon: Double,
                     _ successHandler: @escaping (WeatherDto) -> Void,
                     _ failureHandler: @escaping (Error) -> Void ){
        //       self.activityInddicator.startAnimating()
        let stringUrl = self.makeUrlString(for: lat, lon)
        guard let url = URL(string: stringUrl) else {return}
        URLSession.shared.dataTask(with: URLRequest(url: url)) {  data, _, error in
            if let error = error {
                let alertController = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .actionSheet)
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    NSLog("OK Pressed")
                }
                alertController.addAction(okAction)
                DispatchQueue.main.async {
                    failureHandler(error)
                    //                   self.present(alertController, animated: true)
                }
            }
            guard let data = data else {return}
            do
            {
                let weatherData = try JSONDecoder().decode(WeatherDto.self, from: data)
                DispatchQueue.main.async {
                    successHandler(weatherData)
                }
            }
            catch
            {
                DispatchQueue.main.async {
                    failureHandler(error)
                }
            }
        }
        .resume()
    }
}

extension FirstScreenModel: CLLocationManagerDelegate {
   
    func locationManager(_ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation])
    {
        guard let location = locations.last else {return }
        self.currentCity.latitude = location.coordinate.latitude
        self.currentCity.longitude = location.coordinate.longitude
    }
}

private extension FirstScreenModel {
    func makeUrlString(for lat: Double, _ lon: Double) -> String {
        "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=4de3d3af67dd40c0bfd877232e6a56af&units=metric&lang=ru"
    }
}


    

