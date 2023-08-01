
import SnapKit
import UIKit




class FirstViewController: UIViewController {
    
    private let currentDate = Date()
    private let dtoConverter: WeatherDtoConverter
    private var eachThreeHourModel: [EachThreeHourViewModel] = []
    private var eachWeekDayModel: [EachWeekDayViewModel] = []
    
    init(model: FirstScreenModel, dtoConverter: WeatherDtoConverter){
        self.model = model
        self.dtoConverter = dtoConverter
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    private let model: FirstScreenModel
    private lazy var ui: FirstScreenView = {
        let ui = FirstScreenView( tableViewDataSource: self)
        return ui
    }()
    
    override func loadView() {
        super.loadView()
        self.view = self.ui
        self.ui.configur()
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ui.reloadTapHandler = { [weak self] in
            self?.loadWeather()
        }
        self.view = self.ui
        self.ui.setCurrentDateView(self.currentDate.dateToString(dateFormat: "EEE,d MMMM, yyyy | HH:mm"))
        self.model.loadLocation()
        self.ui.weekWeatherTapHandler = {
            let weekController = SecondViewController()
            self.navigationController?.pushViewController(weekController, animated: true)
            weekController.weatherList = self.eachWeekDayModel
        }
        self.ui.changeCityTapHandler = {
            self.navigationController?.pushViewController(FirstScreenAssembly.make(), animated: true)
//            let third = CityesViewController()
//            self.navigationController?.pushViewController(third, animated: true)
//            third.cityHandler = { [weak self] name, lat, lon in
//                guard let self = self else {return}
//                self.ui.setCityLabelText(name)
//                self.model.currentCity.latitude = lat
//                self.model.currentCity.longitude = lon
//            }
        }
    }
}

private extension FirstViewController {
    func loadWeather(){
        self.ui.startAnimating()
        
//        self.model.locationHandler = { [weak self] latitude, longitude in
//            guard let self = self else {return}
//            self.model.currentCity.latitude = latitude
//            self.model.currentCity.longitude = longitude
//        }
        
        let successHeandler: (WeatherDto) -> Void = { [weak self] weatherData in
            guard let self = self else {return}
            self.ui.stopAnimating()
            self.eachThreeHourModel = self.dtoConverter.convertToViewModel(from: weatherData)
            self.eachWeekDayModel = self.dtoConverter.convertToWeekDay(from: weatherData)
            self.ui.setCurrentTemperature(self.eachThreeHourModel[0].temperature + "°")
            self.ui.update()
            
        }
        let failureHandler: (Error) -> Void = { [weak self] error in
            guard let self = self else {return}
            self.ui.stopAnimating()
            self.ui.showAlert(error: error, title: "Ошибка", messege: error.localizedDescription)
            self.ui.loadWeatherHandler = {
                self.loadWeather()
            }
            self.ui.presentHandler = { alertController in
                self.present(alertController, animated: true)
            }
        }
        
        self.model.loadWeather(for: self.model.currentCity.latitude, self.model.currentCity.longitude, successHeandler, failureHandler)
        
    }
}




extension FirstViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func dateChange(date: [String])-> [String]{
        var newDtTxt = [String]()
        date.forEach { string in
            var newDate = string
            let index = newDate.startIndex
            newDate.removeSubrange(index...newDate.index(index, offsetBy: 10))
            // newDate.removeSubrange(newDate.index(index, offsetBy: 4)...newDate.index(before: newDate.endIndex))
            newDate.removeLast(3)
            newDtTxt.append(newDate)
        }
        return newDtTxt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.key) as? CustomCell else {return UITableViewCell()}
        cell.fill(textTime: self.eachThreeHourModel.filter{ it in
            return it.time.contains(currentDate.dateToString(dateFormat: "yyy-MM-dd"))
        }.map({ it in
            var time2 = it.time
            let index = time2.startIndex
            let index2 = time2.index(index, offsetBy: 9)
            time2.removeSubrange(index...index2)
            let index5 = time2.index(index, offsetBy: 6)
            time2.removeSubrange(index5..<time2.endIndex)
            return time2
        })[indexPath.row],
                  textDescription: self.eachThreeHourModel[0].description,
                  textTemperature: self.eachThreeHourModel[indexPath.row].temperature + "°", textWind: self.eachThreeHourModel[indexPath.row].windSpeed + " м/с")
        //        eachThreeHourModel[indexPath.row].remoteImage.imageDidLoad = { image in
        //            guard let image = image else {return print("error image")}
        //            cell.fill(image: image)}
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.eachThreeHourModel.filter { it in
            it.time.contains(currentDate.dateToString(dateFormat: "yyy-MM-dd"))
        }.count
        
    }
    
    
    
    
    
}
