//
//  DetailViewController.m
//  AssessmentTwo
//
//  Created by Cameron Flowers on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityStateTextField;
@property (strong, nonatomic) IBOutlet UIImageView *cityImageView;
@property (strong, nonatomic) IBOutlet UILabel *wikepediaLabel;
@property UITapGestureRecognizer *gestureRecognizer;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cityNameTextField.text = self.city.cityName;
    self.cityStateTextField.text = self.city.cityState;
    self.cityImageView.image = self.city.cityImage;

}

- (IBAction)onButtonTapped:(UIButton *)sender {
    [self.delegate showFavoriteCity];
}


-(void)viewWillDisappear:(BOOL)animated{
    [self.delegate updateTextwithCity:self.cityNameTextField.text withState:(NSString*)self.cityStateTextField.text inIndex:self.indexPath];
}



- (IBAction)onLabelTap:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"Tap");
    [self performSegueWithIdentifier:@"PresentWebView" sender:gestureRecognizer];
}



- (IBAction)unwindToDescriptionView:(UIStoryboardSegue*)sender

{
//    UIViewController *sourceViewController = sender.sourceViewController;
//    // Pull any data from the view controller which initiated the unwind segue.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    WebViewController *wvc = [segue destinationViewController];
    wvc.city = self.city;
    

}



@end
