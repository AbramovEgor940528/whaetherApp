//
//  TopContentView.swift
//  weatherApp
//
//  Created by Егор Абрамов on 30.06.2024.
//

import UIKit

final class TopContentView: UIView {
    
    // MARK: Private UI properties
    
    /// Лейбл города
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 37, weight: .regular)
        
        return label
    }()
    
    /// Лейбл температуры
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 102, weight: .thin)
        
        return label
    }()
    
    // Лейбл погодных условий
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    // Лейбл максимальной и минимальной температуры
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    // MARK: Internal methods
    
    /// Метод для установки значений текущей погоды
    func set(
        location: String,
        temperature: Double,
        condition: String,
        minTemp: Double = .zero,
        maxTemp: Double = .zero
    ) {
        locationLabel.text = location
        temperatureLabel.text = "\(Int(temperature))°"
        conditionLabel.text = condition
        maxMinTempLabel.text = "H:\(Int(maxTemp))°  L:\(Int(minTemp))°"
        
    }
    
    // MARK: Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func setupLabels() {
        // Добавляем лейблы на родительскую вью
        addSubview(locationLabel)
        addSubview(temperatureLabel)
        addSubview(conditionLabel)
        addSubview(maxMinTempLabel)
        
        // верстаем добавленные лейблы
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: -6),
            /// Левый отступ больше правого из-за визуального искажения знаком Цельсия
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            conditionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -18),
            conditionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            conditionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            maxMinTempLabel.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor),
            maxMinTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            maxMinTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
}
