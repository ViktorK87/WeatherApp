

import Foundation
import UIKit

final class SeconndScreenAssembly
{
    static func make(eachWeekDayModel: [EachWeekDayViewModel]) -> UIViewController {
        let model = FirstScreenModel()
        let dtoConverter = WeatherDtoConverter()
        let vc = SecondScreen(model: model, dtoConverter: dtoConverter, eachWeekDayModel: eachWeekDayModel)
        return vc
    }
}
