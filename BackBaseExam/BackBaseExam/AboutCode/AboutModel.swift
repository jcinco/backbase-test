import Foundation

// MARK: - AboutModel protocol

public protocol AboutModel {
    func loadAboutInfo(with presenter: AboutPresenter)
}

// MARK: - Model class implementation

public class AboutModelImpl: NSObject, AboutModel {
    
    public var city:City? = nil
    
    public override init() {
        super.init()
    }
    
    public func loadAboutInfo(with presenter: AboutPresenter) {
        guard let inCity = city
            else {
                presenter.aboutInfoDidFailLoading(error: ModelError.failedLoading)
                return
        }
        
        let cityInfo = CityInfo(country: inCity.country, name: inCity.name, coord: "Latitude: \(inCity.coord.lat), Longitude: \(inCity.coord.lon)")
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            presenter.aboutInfoDidLoad(aboutInfo: cityInfo)
        }
    }
}

// MARK: - Custom ModelError object

public enum ModelError: Error {
    case failedLoading
}

extension ModelError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failedLoading: return "Failed to load About information."
        }
    }
}
