

import SnapKit
import UIKit

class CollectionScreenView: UIView {
    
    let buttonColor: UIColor = UIColor(red: 64/255, green: 38/255, blue: 98/255, alpha: 1.0)
    
    lazy var sevenDayslabel: UILabel  = {
          let obj = UILabel()
           obj.backgroundColor = .clear
          obj.text = "7 Дней"
          obj.textAlignment = .center
           obj.textColor = .white
          return obj
      }()
   
      lazy var backspaceButton: UIButton = {
          let obj = UIButton()
          obj.backgroundColor = self.buttonColor
          obj.setImage(UIImage(named: "leftArrow"), for: .normal)
          obj.addTarget(self, action: #selector(returnToPreviousScreen), for: .touchUpInside)
          obj.layer.cornerRadius = 8
          obj.clipsToBounds = true
          return obj
      }()
    
    var returnHandler: (() -> Void)?
    
    @objc func returnToPreviousScreen(){
        self.returnHandler?()
    }
    
    func configur(){
    
    self.addSubview(self.sevenDayslabel)
    self.addSubview(self.backspaceButton)
    self.backspaceButton.snp.makeConstraints { pin in
        pin.top.equalToSuperview().offset(60)
        pin.height.equalTo(30)
        pin.left.equalToSuperview().offset(10)
        pin.width.equalTo(30)
    }
    self.sevenDayslabel.snp.makeConstraints { pin in
        pin.top.equalToSuperview().offset(60)
        pin.height.equalTo(30)
        pin.left.equalTo(self.backspaceButton.snp.right).offset(10)
        pin.right.equalToSuperview().offset(-20)
    }
    }
    
}

