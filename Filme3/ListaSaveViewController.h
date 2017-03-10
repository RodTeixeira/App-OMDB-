//
//  ListaSaveViewController.h
//  Filme3
//
//  Created by Rodolfo Teixeira on 08/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaSaveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
