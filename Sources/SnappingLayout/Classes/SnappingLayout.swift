//
//  HorizontalSnappingLayout.swift
//

import UIKit

/// This works best when setting `collectionView.decelerationRate = .fast`.
public class SnappingLayout: UICollectionViewFlowLayout {

    // MARK: - Enums

    public enum SnapPositionType: Int {
        case left
        case center
        case right
        case top
        case bottom
    }

    // MARK: - Properties

    /// Position to snap the cells.
    public var snapPosition = SnapPositionType.center

    /// Minimum horizontal velocity to trigger the snap effect.
    private let minimumSnapVelocity: CGFloat = 0.3

    // MARK: - UICollectionViewFlowLayout

    public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        var offsetAdjusment = CGFloat.greatestFiniteMagnitude
        let horizontalPosition: CGFloat
        let verticalPosition: CGFloat
        
        switch scrollDirection {
        case .horizontal:
            switch snapPosition {
            case .left:
                horizontalPosition = proposedContentOffset.x + collectionView.contentInset.left + sectionInset.left
                verticalPosition = proposedContentOffset.y
            case .center:
                horizontalPosition = proposedContentOffset.x + (collectionView.bounds.width * 0.5)
                verticalPosition = proposedContentOffset.y
            case .right:
                horizontalPosition = proposedContentOffset.x + collectionView.bounds.width - sectionInset.right
                verticalPosition = proposedContentOffset.y
            case .top, .bottom:
                horizontalPosition = proposedContentOffset.x
                verticalPosition = proposedContentOffset.y
            }
        case .vertical:
            switch snapPosition {
            case .left, .right:
                horizontalPosition = proposedContentOffset.x
                verticalPosition = proposedContentOffset.y
            case .center:
                horizontalPosition = proposedContentOffset.x
                verticalPosition = proposedContentOffset.y + (collectionView.bounds.height * 0.5)
            case .top:
                horizontalPosition = proposedContentOffset.x
                verticalPosition = proposedContentOffset.y + collectionView.bounds.height - sectionInset.top
            case .bottom:
                horizontalPosition = proposedContentOffset.x
                verticalPosition = proposedContentOffset.y + collectionView.bounds.height - sectionInset.bottom
            }
        }
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: proposedContentOffset.y, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
        layoutAttributesArray?.forEach { layoutAttributes in
            
            switch scrollDirection {
            case .horizontal:
                let itemHorizontalPosition: CGFloat
                
                switch snapPosition {
                case .left:
                    itemHorizontalPosition = layoutAttributes.frame.minX - collectionView.contentInset.left
                case .center:
                    itemHorizontalPosition = layoutAttributes.center.x
                case .right:
                    itemHorizontalPosition = layoutAttributes.frame.maxX + collectionView.contentInset.right
                case .top, .bottom:
                    itemHorizontalPosition = horizontalPosition
                }
                
                if abs(itemHorizontalPosition - horizontalPosition) < abs(offsetAdjusment) {
                    // If the drag velocity is lower than the minimum velocity (no matter the direction):
                    // snap the current cell to it's original position.
                    if abs(velocity.x) < self.minimumSnapVelocity {
                        offsetAdjusment = itemHorizontalPosition - horizontalPosition
                    }
                    // If the velocity is higher than the snap threshold and drag is right->left:
                    // move to the next cell on the right.
                    else if velocity.x > 0 {
                        offsetAdjusment = itemHorizontalPosition - horizontalPosition + (layoutAttributes.bounds.width + self.minimumLineSpacing)
                    }
                    // If the velocity is higher than the snap threshold and drag is left->right:
                    // move to the next cell on the left.
                    else { // velocity.x < 0
                        offsetAdjusment = itemHorizontalPosition - horizontalPosition - (layoutAttributes.bounds.width + self.minimumLineSpacing)
                    }
                }
            case .vertical:
                let itemVerticalPosition: CGFloat

                switch snapPosition {
                case .left, .right:
                    itemVerticalPosition = verticalPosition
                case .center:
                    itemVerticalPosition = layoutAttributes.center.y
                case .top:
                    itemVerticalPosition = layoutAttributes.frame.minY - collectionView.contentInset.top
                case .bottom:
                    itemVerticalPosition = layoutAttributes.frame.minY + collectionView.contentInset.bottom
                }
                
                if abs(itemVerticalPosition - verticalPosition) < abs(offsetAdjusment) {
                    // If the drag velocity is lower than the minimum velocity (no matter the direction):
                    // snap the current cell to it's original position.
                    if abs(velocity.y) < self.minimumSnapVelocity {
                        offsetAdjusment = itemVerticalPosition - verticalPosition
                    }
                    // If the velocity is higher than the snap threshold and drag is right->left:
                    // move to the next cell on the right.
                    else if velocity.y > 0 {
                        offsetAdjusment = itemVerticalPosition - verticalPosition + (layoutAttributes.bounds.height + self.minimumLineSpacing)
                    }
                    // If the velocity is higher than the snap threshold and drag is left->right:
                    // move to the next cell on the left.
                    else { // velocity.x < 0
                        offsetAdjusment = itemVerticalPosition - verticalPosition - (layoutAttributes.bounds.height + self.minimumLineSpacing)
                    }
                }
            }
            
            
        }

        return CGPoint(x: proposedContentOffset.x + offsetAdjusment, y: proposedContentOffset.y + offsetAdjusment)
    }
}
