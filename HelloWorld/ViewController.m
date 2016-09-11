//
//  ViewController.m
//  HelloWorld
//
//  Created by Guillermo Alonso on 09/09/16.
//  Copyright © 2016 cep.UNAM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



-(BOOL)insertaUsuario: (NSString *) nombreUsuario
            apellidos: (NSString *) apellidos
                 edad: (NSInteger) edad
                email: (NSString *) email{
    //Buscar el contexto de la base de datos
    
    //Crear entity usuario
    
    //setear valores
    
    //guardar contexto
    
    //todo bien?
    
    return YES; // Es el valor treu == YES false == NO
};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self insertaUsuario:@"Guillermo" apellidos:@"Alonso" edad:34 email:@"guillermoabg82@hotmail.com"];
    
    //Establecer tamaño del contentView tomando como referencia
    //donde termina rl último objeto.
    CGFloat maxY = CGRectGetMaxY(self.textfield6.frame);
    CGFloat ancho = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGSize nuevoTamanio=CGSizeMake(ancho, maxY + 15.0);
    self.scrollview.contentSize=nuevoTamanio;
}


-(void) viewWillAppear:(BOOL)animated{
    //Es cuando va a apacrecer la vista
    NSLog(@"Es cuando va a apacrecer la vista");//Esto es un mensaje que se ve enla consola de debug
}

-(void) viewDidAppear:(BOOL)animated{
    //Es cuando la vista ya apareció
    NSLog(@"Es cuando la vista ya apareció");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tecladoAparece:) name:UIKeyboardDidShowNotification object:nil
    ];//Siempre regresa un objeto NSNitification
    //Con los dos puntos ene l selector nos dice que va a recibir un patámetro.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tecladoDesaparece:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)tecladoAparece:(NSNotification *) laNotificacion{
    //En este caso el objeto notification trae un objeto info que es de la instancia NSDictionary
    //que en este caso nos interesa saber para que modifiquemos el tamaño del scrollview al tamaño
    //del teclado.
    if(tecladoArriba){
        return;
    }else{
       [self ajustascroll:YES conNotificacion:laNotificacion];
    }/*else{//Lo ponemos abajo para que no estemos repitiendo código
        NSDictionary *info = laNotificacion.userInfo;
        NSValue *value = [info valueForKey:UIKeyboardFrameEndUserInfoKey];
    
        CGRect frameDelTeclado = [value CGRectValue];
        CGSize tamanio = self.scrollview.contentSize;
        tamanio.height+= frameDelTeclado.size.height;
        self.scrollview.contentSize= tamanio;
        tecladoArriba=YES;
    }*/
}

-(void) tecladoDesaparece:(NSNotification *) laNotificacion{
    [self ajustascroll:NO conNotificacion:laNotificacion];
}

-(void) ajustascroll: (BOOL) aumenta conNotificacion:(NSNotification *) laNotificacion{
    NSDictionary *info = laNotificacion.userInfo;
    NSValue *value = [info valueForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect frameDelTeclado = [value CGRectValue];
    CGSize tamanio = self.scrollview.contentSize;
    if(aumenta){
        tamanio.height+= frameDelTeclado.size.height;
    }else{
        tamanio.height-= frameDelTeclado.size.height;
    }
    self.scrollview.contentSize= tamanio;
    tecladoArriba=aumenta;

}

-(void) viewWillDisappear:(BOOL)animated{
    //La vista esta apunto de desaparecer(Cambio de viewcontroler)
}

-(void) viewDidDisappear:(BOOL)animated{
    //La vista ya desapareció
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender {
    /*if([self.textfield1 isFirstResponder])
        [self.textfield1 resignFirstResponder];
    if([self.textfield2 isFirstResponder])
        [self.textfield2 resignFirstResponder];
    if([self.textfield3 isFirstResponder])
        [self.textfield3 resignFirstResponder];
    if([self.textfield4 isFirstResponder])
        [self.textfield4 resignFirstResponder];
    if([self.textfield5 isFirstResponder])
        [self.textfield5 resignFirstResponder];
    if([self.textfield6 isFirstResponder])
        [self.textfield6 resignFirstResponder];*/
    ////Opcional optimizando el código
    for(UIView *unView in self.scrollview.subviews){
        if ([unView isKindOfClass:[UITextField class]]){
            if([((UITextField *) unView) isFirstResponder]){
                [((UITextField *) unView) resignFirstResponder];
            }
        }
    }
}

- (IBAction)botonTouch:(id)sender {
    //TODO: validar que los campos de texto sean correctos
    NSString *mensajeError;
    if([self.textfield1.text isEqualToString:@""])
        mensajeError=@"Falta el nombre";
    else if([self.textfield2.text isEqualToString:@""])
        mensajeError=@"Falta el apellido";
    else if([self.textfield3.text isEqualToString:@""])
        mensajeError=@"Falta el email";
    else if([self.textfield4.text isEqualToString:@""])
        mensajeError=@"Falta la edad";
    if(mensajeError!=nil){
        //TODO: Presentar alert como mensaje de error
        UIAlertController *ac=[UIAlertController alertControllerWithTitle:@"EROOOR!!!" message:mensajeError preferredStyle:UIAlertControllerStyleAlert];//Esto solo hace el mensaje sin botones para inter actuar
        UIAlertAction *botonOk = [UIAlertAction actionWithTitle:@"Ni pex..." style:UIAlertActionStyleDefault handler:nil];
        [ac addAction:botonOk];
        [self presentViewController:ac animated:YES completion:nil];//Esto muestra el mensaje
    }else{
        [self performSegueWithIdentifier:@"loginOK" sender:self];
    }
}
@end
