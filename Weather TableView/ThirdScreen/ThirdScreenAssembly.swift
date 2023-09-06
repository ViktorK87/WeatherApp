

import Foundation
import UIKit

final class ThirdScreenAssembly
{
    static func make(cityTapHandler: @escaping (_ name: String, _ long: Double, _ lat: Double) -> Void) -> UIViewController {
        let vc = CityesViewController()
        vc.cityTapHandler = cityTapHandler
        return vc
    }
}
