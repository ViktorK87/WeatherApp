
// ЭКРАН ВЫБОРА ГОРОДА:


import SnapKit
import UIKit

final class ThirdScreenView: UIView
{
   private let buttonColor: UIColor = UIColor(red: 64/255, green: 38/255, blue: 98/255, alpha: 1.0)
   private let cityButtonColor: UIColor = UIColor(red: 64/255, green: 38/255, blue: 98/255, alpha: 1.0)
    
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
    
    
    public var londonWasSelectHandler: (() -> Void)?
    public var berlinWasSelectHandler: (() -> Void)?
    public var newYorkWasSelectHandler: (() -> Void)?
    public var marcelWasSelectHandler: (() -> Void)?
    
    public var backViewTapHandler: (() -> Void)?
    
    
    @objc func londonCoord(){
        self.londonWasSelectHandler?()
        self.backViewTapHandler?()
    }
    
    @objc func berlinSelect(){
        self.berlinWasSelectHandler?()
        self.backViewTapHandler?()
    }
    @objc func newYorkMeteo(){
        self.newYorkWasSelectHandler?()
        self.backViewTapHandler?()
    }
    @objc func marcelMeteo(){
        self.marcelWasSelectHandler?()
        self.backViewTapHandler?()
    }
    @objc func backView(){
        self.backViewTapHandler?()
    }
    
   
    
    func configure(){
        self.addSubview(self.backButton)
        self.addSubview(self.label)
        self.addSubview(self.londonButton)
        self.addSubview(berlinButton)
        self.addSubview(self.newYorkButton)
        self.addSubview(self.marcelButton)
        
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

extension ThirdScreenView {
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
