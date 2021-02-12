# SnappingLayout

[![Version](https://img.shields.io/cocoapods/v/SnappingLayout.svg?style=flat)](https://cocoapods.org/pods/SnappingLayout)
[![License](https://img.shields.io/cocoapods/l/SnappingLayout.svg?style=flat)](https://cocoapods.org/pods/SnappingLayout)
[![Platform](https://img.shields.io/cocoapods/p/SnappingLayout.svg?style=flat)](https://cocoapods.org/pods/SnappingLayout)

## Description

**SnappingLayout** enables a snap behaviour for `UICollectionViews`.
It works with horizontal scrolling and there are 3 different types: left, center and right.
You can scroll your collection view and it will automatically snap to the chosen position after decelerating.

The snap supports all kinds of collection view configurations: with `sectionInset`, `minimumLineSpacing`, `contentInset` and so forth.

## Requirements

iOS 9.0

Swift 4.2

## Installation

**SnappingLayout** is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SnappingLayout'
```

## Example Project

To run the example project, clone the repo, and run pod install from the Example directory first. 
Open **SnappingPresentationViewController** to see the code needed to implement the snapping.

## Usage

Just use **SnappingLayout** as a replacement for the traditional **UICollectionViewFlowLayout**.

It's as simple as:
1. Importing it:
```
import SnappingLayout
```
2. Instantiating it:
```
let snappingLayout = SnappingLayout()
```
3. And using it:
```
let collectionView = UICollectionView(frame: .zero, collectionViewLayout: snappingLayout)
```
4. Set the deceleration rate of the collection view to fast:
```
collectionView.decelerationRate = .fast
```

There are three types of `snappingLayout`: left, center and right.

### Left

This is the **default value** when a new instance of `snappingLayout` is created and it will snap the position of the cell to the left side of the collection view.

```
let snappingLayout = SnappingLayout()
snappingLayout.snapPosition = .left
```

![left](https://github.com/getmimo/SnappingLayout/tree/master/readmeImages/left.gif)

### Center

This will snap the position of the cell to the center of the collection view.

```
let snappingLayout = SnappingLayout()
snappingLayout.snapPosition = .center
```

![center](https://github.com/getmimo/SnappingLayout/tree/master/readmeImages/center.gif)

### Right

This will snap the position of the cell to the right of the collection view.

```
let snappingLayout = SnappingLayout()
snappingLayout.snapPosition = .right
```

![right](https://github.com/getmimo/SnappingLayout/tree/master/readmeImages/right.gif)


## Author

Kévin, kvdesa@gmail.com

## License

SnappingLayout is available under the MIT license. See the LICENSE file for more info.
