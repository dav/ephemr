//
//  SKSecondViewController.m
//  Ephemr
//
//  Created by dav on 1/8/13.
//  Copyright (c) 2013 SekaiNo. All rights reserved.
//

#import "SKSecondViewController.h"

@interface SKSecondViewController ()
@property (nonatomic, readonly) UIImage* mask;
@end

@implementation SKSecondViewController

@synthesize mask = _mask;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    self.title = @"Display";
    self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad {
    [super viewDidLoad];
  
  UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
  [self.view addGestureRecognizer:panRecognizer];
}

- (void) viewWillAppear:(BOOL)animated {
  if (!self.displayImage) {
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imageData"];
    if (imageData) {
      self.displayImage = [UIImage imageWithData:imageData];
    }
  }
  
  self.displayImageView.image = self.displayImage;
  self.maskImageView.image = self.mask;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

// super simple kludge for creating the effect
- (void) panDetected:(UIPanGestureRecognizer*)sender {
  CGRect frame = self.maskImageView.frame;
  CGFloat step = frame.origin.x - 1;
  if (step<-5) {
    step=5;
  }
  frame.origin.x = step;
  frame.origin.y = step + 43;
  self.maskImageView.frame = frame;
  
}

#pragma mark -

- (UIImage*) mask {
  if (!_mask) {
    CGFloat width = self.maskImageView.frame.size.height + 10;
    CGFloat height = self.maskImageView.frame.size.height + 10;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, width, height));
    
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetLineWidth(context, 4);
    
    CGContextBeginPath(context);
    for (int i=0; i<(int)width; i+=6) {
      CGContextMoveToPoint(context, i, 0.0f);
      CGContextAddLineToPoint(context, i, height);
      CGContextMoveToPoint(context, 0.0f, i);
      CGContextAddLineToPoint(context, width, i);
    }
    CGContextStrokePath(context);

    UIGraphicsPopContext();
    
    _mask = UIGraphicsGetImageFromCurrentImageContext();
    CFBridgingRetain(_mask);
    
    UIGraphicsEndImageContext();
  }
  return _mask;
}

@end
