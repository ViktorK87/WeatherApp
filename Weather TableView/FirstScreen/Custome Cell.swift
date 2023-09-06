
import SnapKit
import UIKit

final class CustomCell: UITableViewCell
{
    static var key: String {
        return "CustomCell"
    }
    
    
    private let timeLabel: UILabel = {
        let obj = UILabel()
        obj.font.withSize(30)
        obj.textAlignment = .left
        obj.textColor = .white
        return obj
        
    }()
    private let image: UIImageView = {
       let obj = UIImageView()
        
        return obj
    }()
    
    private let descriptLabel: UILabel = {
        let obj = UILabel()
        obj.backgroundColor = .clear
        obj.textAlignment = .center
        obj.adjustsFontSizeToFitWidth = true
        obj.numberOfLines += 1
        obj.textColor = .white
        return obj
    }()
    private let temperatureLabel: UILabel = {
        let obj = UILabel()
       
        obj.textAlignment = .justified
        obj.numberOfLines += 1
        obj.font.withSize(30)
        obj.textAlignment = .center
        obj.textColor = .white
        return obj
    }()
   private let windLabel: UILabel = {
        let obj = UILabel()
        obj.font.withSize(30)
       obj.textAlignment = .center
       obj.textColor = .white
        return obj
    }()
    
    
    func fill(textTime: String, textDescription: String, textTemperature: String, textWind: String){
        self.makelabelConstraints()
        self.timeLabel.text = textTime
        self.descriptLabel.text = textDescription
        self.temperatureLabel.text = textTemperature
        self.windLabel.text = textWind
    }
    func fill(image: UIImage){
        self.image.image = image
    }
}


private extension CustomCell {
    func makelabelConstraints(){
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(descriptLabel)
        self.contentView.addSubview(temperatureLabel)
        self.contentView.addSubview(windLabel)
        self.contentView.addSubview(image)
        self.timeLabel.snp.makeConstraints { pin in
            pin.top.equalToSuperview()
            pin.left.equalToSuperview()
            pin.width.equalToSuperview().dividedBy(5)
            pin.bottom.equalToSuperview()
        }
        self.image.snp.makeConstraints { pin in
            pin.left.equalTo(timeLabel.snp.right)
            pin.width.equalTo(timeLabel.snp.width)
            pin.top.equalToSuperview()
            pin.bottom.equalToSuperview()
        }
        self.descriptLabel.snp.makeConstraints { pin in
            pin.left.equalTo(image.snp.right)
            pin.height.equalTo(timeLabel.snp.height)
            pin.width.equalTo(timeLabel.snp.width)
        }
        self.temperatureLabel.snp.makeConstraints { pin in
            pin.left.equalTo(descriptLabel.snp.right)
            pin.width.equalTo(timeLabel.snp.width)
            pin.height.equalTo(timeLabel.snp.height)
        }
        self.windLabel.snp.makeConstraints { pin in
            pin.top.equalToSuperview()
            pin.left.equalTo(temperatureLabel.snp.right)
            pin.width.equalTo(timeLabel.snp.width)
            pin.height.equalTo(timeLabel.snp.height)
        }
        }
}
