//
//  ListaFilmes.h
//  Filme3
//
//  Created by Rodolfo Teixeira on 09/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "filme.h"

@interface ListaFilmes : NSObject
+(instancetype)threadService;

-(void)fncfilme:(NSString*)filmeNfc success:(void(^)(NSArray<filme*>*))success error:(void(^)(NSURLSessionDataTask* sessionTesk,NSError*travo))error;

-(void)fncDetalhe:(NSString*)detalhe success:(void(^)(filme*))success error:(void(^)(NSURLSessionDataTask* sessionTesk,NSError*travo))error;



@end
