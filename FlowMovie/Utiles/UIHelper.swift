//
//  UIHelper.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//

import UIKit

struct UIHelper {
    static func createProductCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
            return movieSection()
        }
        return layout
    }
    
    static func movieSection() -> NSCollectionLayoutSection {
        //Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 12)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(5/7))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
        
        //Section
        let section = NSCollectionLayoutSection(group: group)

        return section
    }
    
    
}
