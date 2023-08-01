import UIKit


final class SecondViewController: UIViewController {
    let buttonColor: UIColor = UIColor(red: 102.0/255, green: 102.0/255, blue: 255.0/255, alpha: 0.64)
    
    struct Metrix {
       static let cellDefaultHeight: CGFloat = 40
   }
    
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
        obj.addTarget(self, action: #selector(backspace), for: .touchUpInside)
        return obj
    }()
 
    @objc func backspace(){
        
        self.navigationController?.popViewController( animated: true)
       
    }
    
    private lazy var secondTableView: UITableView = {
       let obj = UITableView()
        obj.register(CustomCell.self, forCellReuseIdentifier: CustomCell.key)
        obj.backgroundColor = UIColor(red: 51.0/255, green: 51.0/255, blue: 153.0/255, alpha: 1.0)
        obj.delegate = self
        obj.dataSource = self
        obj.tableFooterView = UIView()
        
        return obj
    }()
    
    var weatherList: [EachWeekDayViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 51.0/255, green: 51.0/255, blue: 153.0/255, alpha: 1.0)
        self.view.addSubview(self.sevenDayslabel)
        self.view.addSubview(self.backspaceButton)
        self.view.addSubview(self.secondTableView)
        self.backspaceButton.snp.makeConstraints { pin in
            pin.top.equalToSuperview().offset(40)
            pin.height.equalTo(30)
            pin.left.equalToSuperview().offset(10)
            pin.width.equalTo(30)
        }
        self.sevenDayslabel.snp.makeConstraints { pin in
            pin.top.equalToSuperview().offset(40)
            pin.height.equalTo(30)
            pin.left.equalTo(self.backspaceButton.snp.right).offset(10)
            pin.right.equalToSuperview().offset(-20)
        }
        
        self.secondTableView.snp.makeConstraints { pin in
            pin.top.equalTo(self.sevenDayslabel.snp.bottom).offset(10)
            pin.left.equalToSuperview().offset(10)
            pin.right.equalToSuperview().offset(-10)
            pin.bottom.equalToSuperview().offset(-30)
        }
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
   
    func dateFromString(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        guard let res = formatter.date(from: string) else {return Date()}
        return res
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.key) as? CustomCell else {return UITableViewCell()}
        cell.fill(textTime: self.weatherList[indexPath.row].weekDay, textDescription: weatherList[indexPath.row].description, textTemperature: self.weatherList[indexPath.row].tempMin, textWind: self.weatherList[indexPath.row].tempMax)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SecondViewController.Metrix.cellDefaultHeight
    }
}
