//
//  ViewController.h
//  HelloWorld
//
//  Created by Guillermo Alonso on 09/09/16.
//  Copyright © 2016 cep.UNAM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    BOOL tecladoArriba;
}

-(BOOL)insertaUsuario: (NSString *) nombreUsuario
            apellidos: (NSString *) apellidos
                 edad: (NSInteger) edad
                email: (NSString *) email;


@property (weak, nonatomic) IBOutlet UITextField *textfield1;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;
@property (weak, nonatomic) IBOutlet UITextField *textfield3;
@property (weak, nonatomic) IBOutlet UITextField *textfield4;
@property (weak, nonatomic) IBOutlet UITextField *textfield5;
@property (weak, nonatomic) IBOutlet UITextField *textfield6;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
- (IBAction)tap:(id)sender;
- (IBAction)botonTouch:(id)sender;

@end

