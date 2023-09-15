import UIKit

class CityesViewController: UIViewController {
    
    public var cityTapHandler: ((_ name: String, _ long: Double, _ lat: Double) -> Void)?
    public var backViewTapHandler: (() -> Void)?

    let cityArray: [(String, Double, Double)] = [(name: "Лондон", longitude: 51.5085300, latitude: -0.1257400), (name: "Берлин", longitude: 13.4105300, latitude: 52.5243700), (name: "Нью Йорк", longitude: -74.0059700, latitude: 40.7142700), (name: "Марсель", longitude: 5.3810700, latitude: 43.2969500) ]

    
    lazy var ui: ThirdScreenView = {
        let ui = ThirdScreenView()
        return ui
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.ui.setGradientBackground()
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.ui
        self.ui.configure()
        self.ui.backViewTapHandler = {
            self.navigationController?.popViewController(animated: true)
        }
        self.ui.londonWasSelectHandler = {[weak self] in
            guard let self = self else {return}
            self.cityTapHandler?(self.cityArray[0].0, self.cityArray[0].1, self.cityArray[0].2)
        }
        self.ui.berlinWasSelectHandler = { [weak self] in
            guard let self = self else {return}
            self.cityTapHandler?(self.cityArray[1].0, self.cityArray[1].1, self.cityArray[1].2)
        }
        self.ui.newYorkWasSelectHandler = {[weak self] in
            guard let self = self else {return}
            self.cityTapHandler?(self.cityArray[2].0, self.cityArray[2].1, self.cityArray[2].2)
        }
        self.ui.marcelWasSelectHandler = {
            self.cityTapHandler?(self.cityArray[3].0, self.cityArray[3].1, self.cityArray[3].2)
        }
    }
    
}


