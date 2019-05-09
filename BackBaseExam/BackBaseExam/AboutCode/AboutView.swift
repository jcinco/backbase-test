import Foundation

// MARK: - AboutView protocol

public protocol AboutView: class {
    func configure(with aboutInfo: CityInfoData)
    func display(error: ModelError)
    func setActivityIndicator(hidden: Bool)
}
