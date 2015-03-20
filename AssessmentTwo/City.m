//
//  City.m
//  AssessmentTwo
//
//  Created by Cameron Flowers on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype)initWithName:(NSString *)name WithState:(NSString *)state WithImage:(UIImage *)image{
    self = [super self];
    if(self){
        self.cityName = name;
        self.cityState = state;
        self.cityImage = image;
    }
    return self;
}

@end
