# RTPagedCollectionViewLayout

[![CI Status](http://img.shields.io/travis/benfen/RTPagedCollectionViewLayout.svg?style=flat)](https://travis-ci.org/rickytan/RTPagedCollectionViewLayout)
[![Version](https://img.shields.io/cocoapods/v/RTPagedCollectionViewLayout.svg?style=flat)](http://cocoapods.org/pods/RTPagedCollectionViewLayout)
[![License](https://img.shields.io/cocoapods/l/RTPagedCollectionViewLayout.svg?style=flat)](http://cocoapods.org/pods/RTPagedCollectionViewLayout)
[![Platform](https://img.shields.io/cocoapods/p/RTPagedCollectionViewLayout.svg?style=flat)](http://cocoapods.org/pods/RTPagedCollectionViewLayout)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### With Interface builder

1. Setup custom `UICollectionViewLayout`

   ![Custom Layout](./ScreenShot/s0.png)

   Setup params

   ![Params](./ScreenShot/s1.png)

### With Code

```objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGFloat width = self.view.bounds.size.width;
    RTPagedCollectionViewLayout *layout = [[RTPagedCollectionViewLayout alloc] init];
    layout.columns = 3;
    layout.rows = 2;
    layout.itemSize = CGSizeMake(30, 30);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, width, 240)
                                                          collectionViewLayout:layout];
    [self.view addSubview:collectionView];
}
```

## ScreenShot

![](./ScreenShot/anim.gif)

## Requirements

* **iOS 6** and up

## Installation

RTPagedCollectionViewLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RTPagedCollectionViewLayout"
```

## Author

Ricky Tan, <ricky.tan.xin@gmail.com>

## License

RTPagedCollectionViewLayout is available under the MIT license. See the LICENSE file for more info.