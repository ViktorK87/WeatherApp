import UIKit

class CityesViewController: UIViewController {
    let buttonColor: UIColor = UIColor(red: 102.0/255, green: 102.0/255, blue: 255.0/255, alpha: 0.64)
    let cityButtonColor: UIColor = UIColor(red: 31.0/255, green: 30.0/255, blue: 90.0/255, alpha: 1.0)
    
    private lazy var backButton: UIButton = {
       let obj = UIButton()
        obj.backgroundColor = self.buttonColor
        obj.layer.cornerRadius = 5
        obj.clipsToBounds = true
        obj.addTarget(self, action: #selector(backView), for: .touchUpInside)
        obj.setImage(UIImage(named: "leftArrow"), for: .normal)
        return obj
    }()
    
    private lazy var londonButton: UIButton = {
       let obj = UIButton()
        obj.backgroundColor = self.cityButtonColor
        obj.layer.cornerRadius = 15
        obj.clipsToBounds = true
        obj.addTarget(self, action: #selector(londonCoord), for: .touchUpInside)
        obj.setTitle("Лондон", for: .normal)
        return obj
    }()
    
    private lazy var berlinButton: UIButton = {
       let obj = UIButton()
        obj.backgroundColor = self.cityButtonColor
        obj.layer.cornerRadius = 15
        obj.clipsToBounds = true
        obj.addTarget(self, action: #selector(berlinSelect), for: .touchUpInside)
        obj.setTitle("Берлин", for: .normal)
        return obj
    }()
    
    private lazy var newYorkButton: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = self.cityButtonColor
        obj.layer.cornerRadius = 15
        obj.clipsToBounds = true
        obj.setTitle("Нью Йорк", for: .normal)
        obj.addTarget(self, action: #selector(newYorkMeteo), for: .touchUpInside)
        return obj
    }()
    
    private lazy var marcelButton: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = self.cityButtonColor
        obj.layer.cornerRadius = 15
        obj.clipsToBounds = true
        obj.setTitle("Марсель", for: .normal)
        obj.addTarget(self, action: #selector(marcelMeteo), for: .touchUpInside)
        return obj
    }()
    
    lazy var label: UILabel = {
        let obj = UILabel()
        obj.text = "Города"
        obj.textAlignment = .center
        obj.textColor = .white
        return obj
    }()
    
    let london = (name: "Лондон", longitude: 51.5085300, latitude: -0.1257400)
    let berlin = (name: "Берлин", longitude: 13.4105300, latitude: 52.5243700)
    let newYork = (name: "Нью Йорк", longitude: -74.0059700, latitude: 40.7142700)
    let marcel = (name: "Марсель", longitude: 5.3810700, latitude: 43.2969500)
    
    var cityHandler: ((_ name: String, _ long: Double, _ lat: Double) -> Void)?
    
    @objc func londonCoord(){
        cityHandler?(self.london.name, self.london.longitude, self.london.latitude)
    }
    
    @objc func berlinSelect(){
        cityHandler?(self.berlin.name, self.berlin.latitude, self.berlin.longitude)
    }
    @objc func newYorkMeteo(){
        cityHandler?(self.newYork.name, self.newYork.latitude, self.newYork.longitude)
    }
    @objc func marcelMeteo(){
        cityHandler?(self.marcel.name, self.marcel.latitude, self.marcel.longitude)
    }
    @objc func backView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 51.0/255, green: 51.0/255, blue: 153.0/255, alpha: 1.0)
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.label)
        self.view.addSubview(self.londonButton)
        self.view.addSubview(berlinButton)
        self.view.addSubview(self.newYorkButton)
        self.view.addSubview(self.marcelButton)
        
        self.backButton.snp.makeConstraints { pin in
            pin.top.equalToSuperview().offset(40)
            pin.left.equalToSuperview().offset(20)
            pin.height.equalTo(30)
            pin.width.equalTo(30)
        }
        self.label.snp.makeConstraints { pin in
            pin.top.equalToSuperview().offset(40)
            pin.left.equalToSuperview().offset(50)
            pin.right.equalToSuperview().offset(-50)
            pin.height.equalTo(30)
        }
        self.londonButton.snp.makeConstraints { pin in
            pin.top.equalTo(self.backButton.snp.bottom).offset(20)
            pin.right.equalToSuperview().offset(-10)
            pin.left.equalToSuperview().offset(10)
            pin.height.equalTo(30)
        }
        self.berlinButton.snp.makeConstraints { pin in
            pin.top.equalTo(self.londonButton.snp.bottom).offset(20)
            pin.left.equalToSuperview().offset(10)
            pin.width.equalTo(self.londonButton.snp.width)
            pin.height.equalTo(self.londonButton.snp.height)
        }
        self.newYorkButton.snp.makeConstraints { pin in
            pin.top.equalTo(self.berlinButton.snp.bottom).offset(20)
            pin.height.equalTo(30)
            pin.left.equalToSuperview().offset(10)
            pin.width.equalTo(self.berlinButton.snp.width)
        }
        self.marcelButton.snp.makeConstraints { pin in
            pin.top.equalTo(self.newYorkButton.snp.bottom).offset(20)
            pin.left.equalToSuperview().offset(10)
            pin.height.equalTo(30)
            pin.width.equalTo(self.newYorkButton.snp.width)
        }
    }
    
}


