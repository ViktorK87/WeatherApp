import UIKit

final class RemoteImage
{
    var imageDidLoad: ((UIImage?) -> Void )?
    var image: UIImage?
    private let urlString: String
    init(url: String){
        self.urlString = url
        
    }

    func load() {
        guard let url = URL(string: self.urlString) else {return}
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unckown error")
                return
            }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                let image = UIImage(data: data)
                self.image = image
                self.imageDidLoad?(image)
                print("Image load")
            }
        }.resume()
    }

}


