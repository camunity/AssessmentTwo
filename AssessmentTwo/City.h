//
//  City.h
//  AssessmentTwo
//
//  Created by Cameron Flowers on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface City : NSObject
@property NSString *cityName;
@property NSString *cityState;
@property UIImage *cityImage;

-(instancetype)initWithName:(NSString *)name WithState:(NSString *)state WithImage:(UIImage *)image;

@end
