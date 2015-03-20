//
//  TableViewController.m
//  AssessmentTwo
//
//  Created by Cameron Flowers on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "TableViewController.h"
#import "City.h"
#import "CityTableViewCell.h"
#import "DetailViewController.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate, DetailDelegate>

@property (strong, nonatomic) IBOutlet UITableView *citiesTableView;
@property NSMutableArray *cities;
@property DetailViewController *dvc;
@property NSString *updateCity;
@property NSString *updateState;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MAH FAVWIT CITIEZ!"; 
    City *chicago = [[City alloc] initWithName:@"Chicago" WithState:@"Illinois" WithImage:[UIImage imageNamed:@"chicago"]];

    City *madrid = [[City alloc] initWithName:@"Madrid" WithState:@"Spain" WithImage:[UIImage imageNamed:@"madrid"]];

    City *paris  = [[City alloc] initWithName:@"Paris" WithState:@"France" WithImage:[UIImage imageNamed:@"paris"]];

    City *rio = [[City alloc] initWithName:@"Rio de Janeiro" WithState:@"Brazil" WithImage:[UIImage imageNamed:@"rio"]];

    self.cities = [[NSMutableArray alloc] initWithObjects:
                   chicago,
                   madrid,
                   paris,
                   rio,
                   nil];

    self.citiesTableView.allowsMultipleSelectionDuringEditing = NO;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    City *city = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = city.cityName;
    cell.detailTextLabel.text = city.cityState;
    cell.imageView.image = city.cityImage;
    return cell;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cities removeObjectAtIndex:indexPath.row];
        [self.citiesTableView reloadData];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(CityTableViewCell *)cell {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    NSIndexPath *indexPath = [self.citiesTableView indexPathForCell:cell];
    City *city = [self.cities objectAtIndex:indexPath.row];
    self.dvc = [segue destinationViewController];
    self.dvc.delegate = self;
    self.dvc.city = city;
    self.dvc.indexPath = indexPath;
}


- (void)showFavoriteCity{
    self.title = self.dvc.city.cityName; 
}


-(void)updateTextwithCity:(NSString *)cityName withState:(NSString *)cityState inIndex:(NSIndexPath *)indexPath{
    self.updateCity = cityName;
    self.updateState = cityState;

    City *city = [self.cities objectAtIndex:indexPath.row];
    city.cityName = cityName;
    city.cityState = cityState;

    [self.citiesTableView reloadData]; 

}
@end
