//
//import UIKit
//import SnapKit
//
//final class CollectionScreenController: UIViewController {
//    struct Metrix {
//          static let cellDefaultHeight: CGFloat = 50
//      }
//
//    init (model: IFirstScreenModel, dtoConverter: WeatherDtoConverter, eachWeekDayModel: [EachWeekDayViewModel]){
//        self.model = model
//        self.dtoConverter = dtoConverter
//        self.eachWeekDayModel = eachWeekDayModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    var eachWeekDayModel: [EachWeekDayViewModel]
//    var model: IFirstScreenModel
//    let dtoConverter: WeatherDtoConverter
//
//    private lazy var ui: CollectionScreenView = {
//        let ui = CollectionScreenView(collectionViewDataSource: self)
//        return ui
//    }()
//
//    override func loadView() {
//        super.loadView()
//        self.view = self.ui
//        self.ui.configur()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        self.setGradientBackground()
//        super.viewWillAppear(animated)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.ui.returnHandler = { [weak self] in
//            self?.navigationController?.popViewController( animated: true)
//        }
//
//    }
//
//}
//extension CollectionScreenController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return self.eachWeekDayModel.count
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomViewCell.key, for: indexPath) as? CustomViewCell else {return UICollectionViewCell()}
////        cell.fill(textTime: self.eachWeekDayModel[indexPath.row].weekDay, textDescription: eachWeekDayModel[indexPath.row].description, textTemperature: self.eachWeekDayModel[indexPath.row].tempMin, textWind: self.eachWeekDayModel[indexPath.row].tempMax)
////        cell.backgroundColor = .clear
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout CollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.ui.frame.width , height: CollectionScreenController.Metrix.cellDefaultHeight )
//    }
//
//}
//
//extension CollectionScreenController {
//    func setGradientBackground(){
//        let color1 = UIColor(red: 51.0/255 ,green: 20.0/255, blue: 61.0/255, alpha: 1.0).cgColor
//        let color2 = UIColor(red: 52.0/255, green: 28.0/255, blue: 109.0/255, alpha: 1.0).cgColor
//        let color3 = UIColor(red: 51.0/255 ,green: 20.0/255, blue: 61.0/255, alpha: 1.0).cgColor
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.view.bounds
//        gradientLayer.colors = [color1, color2, color3]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
//    }
//}
