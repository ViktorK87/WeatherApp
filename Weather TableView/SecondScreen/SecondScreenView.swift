//
//import Foundation
//import SnapKit
//import UIKit
//
//// Экран погоды на 7 дней
//final class SecondScreenView: UIView
//{
//    struct Metrix {
//        static let cellDefaultHeight: CGFloat = 40
//    }
//
//    private lazy var tableViewDelegat: UITableViewDelegate = self
//    private var tableViewDataSourse: UITableViewDataSource
//    let buttonColor: UIColor = UIColor(red: 102.0/255, green: 102.0/255, blue: 255.0/255, alpha: 0.64)
//
//    public init(tableViewDataSourse: UITableViewDataSource){
//        self.tableViewDataSourse = tableViewDataSourse
//        super.init(frame: .zero)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    lazy var sevenDayslabel: UILabel  = {
//       let obj = UILabel()
//        obj.backgroundColor = .clear
//       obj.text = "7 Дней"
//       obj.textAlignment = .center
//        obj.textColor = .white
//       return obj
//   }()
//
//   lazy var backspaceButton: UIButton = {
//       let obj = UIButton()
//       obj.backgroundColor = self.buttonColor
//       obj.setImage(UIImage(named: "leftArrow"), for: .normal)
//       obj.addTarget(self, action: #selector(backspace), for: .touchUpInside)
//       return obj
//   }()
//
//
//
//   private lazy var secondTableView: UITableView = {
//      let obj = UITableView()
//       obj.register(CustomCell.self, forCellReuseIdentifier: CustomCell.key)
//       obj.backgroundColor = UIColor(red: 51.0/255, green: 51.0/255, blue: 153.0/255, alpha: 1.0)
//       obj.delegate = self
//       obj.dataSource = self.tableViewDataSourse
//       obj.tableFooterView = UIView()
//       return obj
//   }()
//
//    public var backspaceHandler: (() -> Void)?
//
//    @objc func backspace(){
//        self.backspaceHandler?()
//    }
//
//    func configur(){
//        self.backgroundColor = UIColor(red: 51.0/255, green: 51.0/255, blue: 153.0/255, alpha: 1.0)
//        self.addSubview(self.sevenDayslabel)
//        self.addSubview(self.backspaceButton)
//        self.addSubview(self.secondTableView)
//        self.backspaceButton.snp.makeConstraints { pin in
//            pin.top.equalToSuperview().offset(40)
//            pin.height.equalTo(30)
//            pin.left.equalToSuperview().offset(10)
//            pin.width.equalTo(30)
//        }
//        self.sevenDayslabel.snp.makeConstraints { pin in
//            pin.top.equalToSuperview().offset(40)
//            pin.height.equalTo(30)
//            pin.left.equalTo(self.backspaceButton.snp.right).offset(10)
//            pin.right.equalToSuperview().offset(-20)
//        }
//
//        self.secondTableView.snp.makeConstraints { pin in
//            pin.top.equalTo(self.sevenDayslabel.snp.bottom).offset(10)
//            pin.left.equalToSuperview().offset(10)
//            pin.right.equalToSuperview().offset(-10)
//            pin.bottom.equalToSuperview().offset(-30)
//        }
//    }
//}
//
//extension SecondScreenView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return Metrix.cellDefaultHeight
//    }
//}
