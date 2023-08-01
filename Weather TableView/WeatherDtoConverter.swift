
import Foundation
import UIKit

public class WeatherDtoConverter {



    func convertToViewModel(from dto: WeatherDto) -> [EachThreeHourViewModel] {
        dto
            .list
            .map { (it: List) -> EachThreeHourViewModel in
                let temperature: String = String(Int(it.main.temp))
                let time: String = it.dtTxt
                let windSpeed: String = String(Int(it.wind.speed))
                let description: String = it.weather[0].description
                let iconNumber: String = it.weather[0].icon
                let image = RemoteImage(url: "https://openweathermap.org/img/wn/01d@2x.png")
                return EachThreeHourViewModel(temperature: temperature, time: time, description: description, windSpeed: windSpeed, iconNumber: iconNumber, remoteImage: image)
            }
    }
    
    func convertToCurrentDay(from dto: WeatherDto) -> [EachThreeHourViewModel] {
        dto
            .list
            .map { (it: List) -> EachThreeHourViewModel in
                let temperature: String = String(Int(it.main.temp))
                let time: String = it.dtTxt
                let windSpeed: String = String(Int(it.wind.speed))
                let description: String = it.weather[0].description
                let iconNumber: String = it.weather[0].icon
                let icon = RemoteImage(url: "https://openweathermap.org/img/wn/\(iconNumber)@2x.png")
                
                return EachThreeHourViewModel(temperature: temperature, time: time, description: description, windSpeed: windSpeed, iconNumber: iconNumber, remoteImage: icon)
            }.filter { it in
                let currentDay = Date().dateToString(dateFormat: "yyy-MM-dd")
                return it.time.contains(currentDay)
            }
        
    }
   
    func convertToWeekDay(from dto: WeatherDto) -> [EachWeekDayViewModel] {
        dto.list
            .filter{ it in
                it.dtTxt.contains("15:00")}
            .map { (it: List) -> EachWeekDayViewModel in
                let tempMin: String = String(Int(it.main.tempMin)) + "°..."
                let tempMax: String = String(Int(it.main.tempMax)) + "°"
                let weekDay: String = weekDayString(date: dateFromString(string: it.dtTxt))
                let description: String = it.weather[0].description
                let iconNumber: String = it.weather[0].icon
                let icon = RemoteImage(url: "https://openweathermap.org/img/wn/\(iconNumber)@2x.png")
                
                return EachWeekDayViewModel(tempMin: tempMin, tempMax: tempMax, weekDay: weekDay, description: description, remoteImage: icon)
            }
        }
}

extension WeatherDtoConverter {
    func weekDayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfTheWeekString = dateFormatter.string(from: date)
        return dayOfTheWeekString
    }

    func dateFromString(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let res = formatter.date(from: string) else {return Date()}
        return res
    }

}
