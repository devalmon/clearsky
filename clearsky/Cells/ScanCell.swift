//
//  ScanCell.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 07.01.2021.
//

import UIKit

class ScanCell: UITableViewCell {
    
    let label = UILabel()
    let img = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "scanCell")
        
        layoutLabel()
        layoutImg()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - layout
    private func layoutLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
 
    private func layoutImg() {
        configureImageView()
        
        img.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(img)
        
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            img.widthAnchor.constraint(equalToConstant: 40),
            img.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: - config
    private func configureImageView() {
        img.image = UIImage(systemName: "iphone")
        img.tintColor = UIColor.darkGray
    }
}
