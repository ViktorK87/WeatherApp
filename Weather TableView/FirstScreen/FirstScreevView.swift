import UIKit
import SnapKit


final class FirstScreenView: UIView {

    struct Metrix {
       static let cellDefaultHeight: CGFloat = 40
   }
    private lazy var tableViewDelegate: UITableViewDelegate = self
    private var tableViewDataSource: UITableViewDataSource
    private let colorButton: UIColor = UIColor(red: 64/255, green: 38/255, blue: 98/255, alpha: 1.0)
    private let touchColorButton: UIColor = UIColor(red: 114/255, green: 99/255, blue: 148/255, alpha: 1.0)
    public init( tableViewDataSource: UITableViewDataSource){
        self.tableViewDataSource = tableViewDataSource
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    private lazy var tableView: UITableView = {
        let obj = UITableView()
        obj.register(CustomCell.self, forCellReuseIdentifier: CustomCell.key)
        obj.backgroundColor = .clear
        obj.delegate = self
        obj.dataSource = self.tableViewDataSource
        obj.tableFooterView = UIView()
        return obj
    }()
    
    private lazy var cityLabel: UILabel = {
        let obj = UILabel()
        obj.backgroundColor = .clear
        obj.text = "Текущее место"
        obj.textAlignment = .center
        obj.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        obj.textColor = .white
        return obj
    }()
    private lazy var reloadButton: UIButton = {
       let obj = UIButton()
        obj.backgroundColor = self.colorButton
        obj.setImage(UIImage(named: "ReloadButton"), for: .normal)
        obj.addTarget(self, action: #selector(reload), for: .touchDown)
        obj.addTarget(self, action: #selector(buttonNormalMode), for: .touchUpInside)
        obj.layer.cornerRadius = 15
        obj.clipsToBounds = true
        return obj
    }()
    
    private lazy var  weatherIconImageView: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage()
        return obj
    }()
    
    private lazy var currentTempView: UILabel = {
        let obj = UILabel()
        obj.text = String()
        obj.textAlignment = .center
        obj.font = obj.font.withSize(50)
        obj.textColor = .white
        return obj
    }()
    
    private lazy var currentDateView: UILabel = {
       let obj = UILabel()
        obj.textAlignment = .center
        obj.textColor = .white
        return obj
    }()
    
    private lazy var weekWeatherScreenButton: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = self.colorButton
        obj.setTitle("Погода на неделю", for: .normal)
        obj.addTarget(self, action: #selector(weekScreen), for: .touchDown)
     
        obj.layer.cornerRadius = 15
        obj.clipsToBounds = true
        return obj
    }()
    
    private lazy var changeCityButton: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = self.colorButton
        obj.setTitle("Выбор города", for: .normal)
        obj.addTarget(self, action: #selector(changeCity), for: .touchUpInside)
        obj.layer.cornerRadius = 15
        obj.clipsToBounds = true
        return obj
    }()
    
    public func update(){
        self.tableView.reloadData()
    }
    
    public func startAnimating(){
        self.createBlur()
        self.activityIndicator.startAnimating()
        self.activityIndicator.color = .white
    }
    public func stopAnimating(){
        self.removeBlurEffect()
        self.activityIndicator.stopAnimating()
    }
    public func setCityLabelText(_ string: String){
        self.cityLabel.text = string
    }
    public func setCurrentTemperature(_ string: String){
        self.currentTempView.text = string
    }
    public func setCurrentDateView(_ string: String){
        self.currentDateView.text = string
    }
    
    public var weekWeatherTapHandler: (() -> Void)?
    public var changeCityTapHandler: (() -> Void)?
    public var reloadTapHandler: (() -> Void)?
    public var loadWeatherHandler: (() -> Void)?
    public var presentHandler: ((_ alertController: UIAlertController) -> Void)?
    
    @objc func buttonNormalMode(){
        self.reloadButton.backgroundColor = self.colorButton
    }
    
    @objc func weekScreen(){
        self.weekWeatherTapHandler?()
    }
    
    @objc func changeCity(){
        self.changeCityTapHandler?()
        self.reloadTapHandler?()
    }
    @objc func reload(){
        self.reloadTapHandler?()
        self.reloadButton.backgroundColor = self.touchColorButton
    }
    private var activityIndicator = UIActivityIndicatorView()
    
    
    
    func configur(){
        self.addSubview(self.cityLabel)
        self.addSubview(self.activityIndicator)
        self.addSubview(self.reloadButton)
        self.addSubview(self.weatherIconImageView)
        self.addSubview(self.currentTempView)
        self.addSubview(self.currentDateView)
        self.addSubview(self.tableView)
        self.addSubview(self.weekWeatherScreenButton)
        self.addSubview(self.changeCityButton)
        self.cityLabel.snp.makeConstraints { pin in
            pin.top.equalToSuperview().offset(30)
            pin.left.equalToSuperview().offset(60)
            pin.right.equalToSuperview().offset(-60)
            pin.height.equalTo(40)
        }
        self.reloadButton.snp.makeConstraints { pin in
            pin.top.equalToSuperview().offset(30)
            pin.left.equalTo(cityLabel.snp.right).offset(10)
            pin.right.equalToSuperview().offset(-10)
            pin.height.equalTo(40)
        }
        self.weatherIconImageView.snp.makeConstraints { pin in
            pin.top.equalTo(cityLabel.snp.bottom).offset(10)
            pin.centerX.equalToSuperview()
            pin.width.equalTo(70)
            pin.height.equalTo(70)
        }
        self.currentTempView.snp.makeConstraints { pin in
            pin.top.equalTo(self.weatherIconImageView.snp.bottom)
            pin.height.equalTo(70)
            pin.left.equalToSuperview()
            pin.right.equalToSuperview()
        }
        self.currentDateView.snp.makeConstraints { pin in
            pin.top.equalTo(currentTempView.snp.bottom)
            pin.width.equalToSuperview()
            pin.height.equalTo(30)
        }
        self.tableView.snp.makeConstraints { pin in
            pin.top.equalTo(currentDateView.snp.bottom).offset(5)
            pin.left.equalToSuperview().offset(10)
            pin.right.equalToSuperview().offset(-10)
            pin.bottom.equalToSuperview().offset(-30)
        }
        self.activityIndicator.snp.makeConstraints { pin in
            pin.left.equalToSuperview().offset(20)
            pin.top.equalToSuperview().offset(30)
            pin.height.equalTo(30)
            pin.width.equalTo(30)
        }
        self.weekWeatherScreenButton.snp.makeConstraints { pin in
            pin.top.equalTo(tableView.snp.bottom).offset(-50)
            pin.left.equalToSuperview().offset(10)
            pin.right.equalToSuperview().offset(-10)
            pin.height.equalTo(30)
        }
        self.changeCityButton.snp.makeConstraints { pin in
            pin.top.equalTo(weekWeatherScreenButton.snp.bottom).offset(10)
            pin.left.equalToSuperview().offset(10)
            pin.right.equalToSuperview().offset(-10)
            pin.height.equalTo(30)
        }
       
    }
  }


extension FirstScreenView {
    func createBlur(){
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.tag = 9
        visualEffectView.frame = self.bounds
        visualEffectView.alpha = 0.5
        self.addSubview(visualEffectView)
    }
    func removeBlurEffect(){
        self.viewWithTag(9)?.removeFromSuperview()
    }
    func showAlert(error: Error, title: String, messege: String){
        let alertController = UIAlertController(title: title, message: messege, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        let reloadBtn = UIAlertAction(title: "Перезапросить данные", style: .default) { UIAlertAction in
            self.loadWeatherHandler?()
        }
        alertController.addAction(okAction)
        alertController.addAction(reloadBtn)
        self.presentHandler?( alertController)
    }
    }
    

extension FirstScreenView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metrix.cellDefaultHeight
    }
    
    
}

extension FirstScreenView {
    func setGradientBackground(){
        let color1 = UIColor(red: 51.0/255 ,green: 20.0/255, blue: 61.0/255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 52.0/255, green: 28.0/255, blue: 109.0/255, alpha: 1.0).cgColor
        let color3 = UIColor(red: 51.0/255 ,green: 20.0/255, blue: 61.0/255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
