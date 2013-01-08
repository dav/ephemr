//
//  SKSecondViewController.h
//  Ephemr
//
//  Created by dav on 1/8/13.
//  Copyright (c) 2013 SekaiNo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKSecondViewController : UIViewController <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImage* displayImage;
@property (nonatomic, strong) IBOutlet UIImageView* displayImageView;
@property (nonatomic, strong) IBOutlet UIImageView* maskImageView;

@end
