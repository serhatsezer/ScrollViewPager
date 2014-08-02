//
//  ViewController.m
//  scrollview
//
//  Created by serhatsezer on 8/2/14.
//  Copyright (c) 2014 serhat sezer. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollVC;
@property (nonatomic,strong) UIStoryboard *mainStoryboard;

// ViewControllers
@property (nonatomic,strong) FirstViewController *firstVC;
@property (nonatomic,strong) SecondViewController *secondVC;
@property (nonatomic,strong) ThirdViewController *thirdVC;

@property (nonatomic,strong) NSArray *vcs;
@property (assign) NSInteger selectedIndex;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    self.vcs = @[self.firstVC, self.secondVC, self.thirdVC];
    self.selectedIndex = 0;
    
    self.scrollVC.contentSize = CGSizeMake(self.scrollVC.frame.size.width * self.vcs.count, self.scrollVC.frame.size.height);

    for(int i = 0; i < _vcs.count; i++) {
        
        UIViewController *currentVC = _vcs[i];
        currentVC.view.frame  = CGRectMake(currentVC.view.frame.size.width * i, 0,
                                               currentVC.view.frame.size.width,
                                               currentVC.view.frame.size.height);
        
        [self.scrollVC addSubview:currentVC.view];
    }
}


-(FirstViewController *)firstVC
{
    if(!_firstVC) {
        _firstVC = [_mainStoryboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    }
    
    return _firstVC;
}

- (SecondViewController *)secondVC
{
    if(!_secondVC) {
        _secondVC = [_mainStoryboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    }
    
    return _secondVC;
}

- (ThirdViewController *)thirdVC
{
    if(!_thirdVC) {
        _thirdVC = [_mainStoryboard instantiateViewControllerWithIdentifier:@"ThirdViewController"];
    }
    
    return _thirdVC;
}

- (IBAction)gotoNextPage:(id)sender
{
    _selectedIndex = (++_selectedIndex % _vcs.count);
    
    UIViewController *currentVC = self.vcs[_selectedIndex];
    
    [UIView animateWithDuration:0.9 animations:^{
        [self.scrollVC setContentOffset:CGPointMake(currentVC.view.frame.size.width * _selectedIndex, self.scrollVC.frame.origin.y) animated:NO];
    }];
}


@end
