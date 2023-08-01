import UIKit

final class FirstScreenAssembly {
    static func make() -> UIViewController {
        let model = FirstScreenModel()
        let dtoConverter = WeatherDtoConverter()
        let vc = FirstViewController(model: model, dtoConverter: dtoConverter)
        return vc
    }
}
