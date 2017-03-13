//
//  ViewController.h
//  Filme3
//
//  Created by Rodolfo Teixeira on 07/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "filme.h"

@interface ViewController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UISearchBar *SearchBar;
@property (weak, nonatomic)   IBOutlet UITableView *TableView;
@property (weak, nonatomic)   IBOutlet UIButton        *btnOK;
@property (strong, nonatomic)NSArray <filme *>  * resultFilme;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activi;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnLista;



@end
