//import UIKit
//
//// Экран погоды на 7 дней
//final class SecondViewController: UIViewController {
//    
//    struct Metrix {
//       static let cellDefaultHeight: CGFloat = 40
//   }
//    
//    
//    init(model: IFirstScreenModel, dtoConverter: WeatherDtoConverter, eachWeekDayModel: [EachWeekDayViewModel]){
//        self.model = model
//        self.dtoConverter = dtoConverter
//        self.weatherList = eachWeekDayModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    
//    var weatherList: [EachWeekDayViewModel] = []
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private var model: IFirstScreenModel
//    private let dtoConverter: WeatherDtoConverter
//    
//    private lazy var ui: SecondScreenView = {
//        let ui = SecondScreenView(tableViewDataSourse: self)
//        return ui
//    }()
//    
//    override func loadView() {
//        super.loadView()
//        self.view = self.ui
//        self.ui.configur()
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.ui.backspaceHandler = {
//            self.navigationController?.popViewController( animated: true)
//        }
//    }
//}
//
//extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
//   
//    func dateFromString(string: String) -> Date {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
//        guard let res = formatter.date(from: string) else {return Date()}
//        return res
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.key) as? CustomCell else {return UITableViewCell()}
//        cell.fill(textTime: self.weatherList[indexPath.row].weekDay, textDescription: weatherList[indexPath.row].description, textTemperature: self.weatherList[indexPath.row].tempMin, textWind: self.weatherList[indexPath.row].tempMax)
//        return cell
//    }
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.weatherList.count
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return SecondViewController.Metrix.cellDefaultHeight
//    }
//}
