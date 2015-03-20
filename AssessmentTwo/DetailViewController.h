//
//  DetailViewController.h
//  AssessmentTwo
//
//  Created by Cameron Flowers on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol DetailDelegate <NSObject>

@optional
-(void)showFavoriteCity;
-(void)updateTextwithCity:(NSString*)cityName withState:(NSString*)cityState inIndex:(NSIndexPath*)indexPath;

@end


@interface DetailViewController : UIViewController
@property City *city;
@property NSIndexPath *indexPath;
@property (nonatomic, assign) id <DetailDelegate> delegate;
@end
