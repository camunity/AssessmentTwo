//
//  WebViewController.m
//  AssessmentTwo
//
//  Created by Cameron Flowers on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "WebViewController.h"
#import "DetailViewController.h"

@interface WebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBarTitle;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self goToURLString];
    self.navBarTitle.title = self.city.cityName;

}


- (NSString *)getAddress{
    //Look and modify the URL based on user input

    NSString *cityText = self.city.cityName;

    [cityText stringByReplacingOccurrencesOfString:@" " withString:@"_"];

    NSString* urlString = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@",cityText];
    NSLog(urlString);
    return urlString;
    }

- (void)goToURLString{

    NSURL *url = [NSURL URLWithString:[self getAddress]]; //create new url based on string
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //url request
    [self.webView loadRequest:request]; //give our webview load the request
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
