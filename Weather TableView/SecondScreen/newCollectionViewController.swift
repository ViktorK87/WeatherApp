
import UIKit

final class SecondScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    init(model: IFirstScreenModel, dtoConverter: WeatherDtoConverter, eachWeekDayModel: [EachWeekDayViewModel]){
        self.model = model
        self.weatherList = eachWeekDayModel
        self.dtoConverter = dtoConverter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct Metrix { static let cellDefaultHeight: CGFloat = 50 }
    
    var model: IFirstScreenModel
    var dtoConverter: WeatherDtoConverter
    var weatherList: [EachWeekDayViewModel]
    
    var collectionView: UICollectionView!
    
    private lazy var ui: CollectionScreenView = {
        let ui = CollectionScreenView()
        return ui
    }()
    
    override func loadView() {
        super.loadView()
        self.view = self.ui
        self.ui.configur()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setGradientBackground()
        super.viewWillAppear(animated)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        self.collectionView.snp.makeConstraints { pin in
            pin.top.equalTo(self.ui.sevenDayslabel.snp.bottom).offset(50)
            pin.bottom.equalToSuperview()
            pin.left.equalToSuperview()
            pin.right.equalToSuperview()
        }
        self.collectionView.backgroundColor = .clear
        self.collectionView.register(CustomViewCell.self, forCellWithReuseIdentifier: CustomViewCell.key)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.ui.returnHandler = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
}

extension SecondScreen {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomViewCell.key, for: indexPath) as? CustomViewCell else {
            return UICollectionViewCell()
        }
        cell.fill(textTime: self.weatherList[indexPath.row].weekDay, textDescription: weatherList[indexPath.row].description, textTemperature: self.weatherList[indexPath.row].tempMin, textWind: self.weatherList[indexPath.row].tempMax)
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.ui.frame.width, height: Metrix.cellDefaultHeight)
    }
    
}

extension SecondScreen {
    func setGradientBackground(){
        let color1 = UIColor(red: 51.0/255 ,green: 20.0/255, blue: 61.0/255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 52.0/255, green: 28.0/255, blue: 109.0/255, alpha: 1.0).cgColor
        let color3 = UIColor(red: 51.0/255 ,green: 20.0/255, blue: 61.0/255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
