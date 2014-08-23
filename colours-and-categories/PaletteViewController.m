
#import "PaletteViewController.h"
#import "ColourSelectionViewController.h"

@interface PaletteViewController ()

@end

@implementation PaletteViewController

@synthesize allPalettes;
@synthesize paletteChosen;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
        // palettes
        
        //capricious
        
        NSMutableArray *paletteOne = [NSMutableArray array];
        
        [paletteOne addObject: [UIColor colorWithRed:234.0/255.0 green:157.0/255.0 blue:140/255.0   alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:62.0/255.0  green:116.0/255.0 blue:139.0/255.0 alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:148.0/255.0 green:110.0/255.0 blue:163.0/255.0 alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:119.0/255.0 green:153.0/255.0 blue:197.0/255.0 alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:137.0/255.0 green:77.0/255.0  blue:159.0/255.0 alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:56.0/255.0  green:44.0/255.0  blue:84.0/255.0  alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:194.0/255.0 green:50.0/255.0  blue:75.0/255.0  alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:193.0/255.0 green:93.0/255.0  blue:125.0/255.0 alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:126.0/255.0 green:35.0/255.0  blue:51.0/255.0  alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:111.0/255.0 green:120.0/255.0 blue:69.0/255.0  alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:163.0/255.0 green:194.0/255.0 blue:110.0/255.0 alpha:1.0]];
        [paletteOne addObject: [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:132.0/255.0 alpha:1.0]];
        
        //classic
        
        NSMutableArray *paletteTwo = [NSMutableArray array];
        
        [paletteTwo addObject: [UIColor colorWithRed:120.0/255.0 green:128.0/255.0 blue:72.0/255.0  alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:129.0/255.0 green:161.0/255.0 blue:190.0/255.0 alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:183.0/255.0 green:175.0/255.0 blue:168.0/255.0 alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:236.0/255.0 green:231.0/255.0 blue:215.0/255.0 alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:113.0/255.0 green:99.0/255.0  blue:79.0/255.0  alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:51.0/255.0  green:34.0/255.0  blue:34.0/255.0  alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:35.0/255.0  green:58.0/255.0  blue:53.0/255.0  alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:212.0/255.0 green:202.0/255.0 blue:152.0/255.0 alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:125.0/255.0 green:77.0/255.0  blue:78.0/255.0  alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:19.0/255.0  green:20.0/255.0  blue:16.0/255.0  alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:63.0/255.0  green:70.0/255.0  blue:75.0/255.0  alpha:1.0]];
        [paletteTwo addObject: [UIColor colorWithRed:95.0/255.0  green:115.0/255.0 blue:135.0/255.0 alpha:1.0]];
        
        //earthy
        
        NSMutableArray *paletteThree = [NSMutableArray array];
        
        [paletteThree addObject: [UIColor colorWithRed:240.0/255.0 green:134.0/255.0 blue:20.0/255.0 alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:112.0/255.0 green:101.0/255.0 blue:0.0/255.0  alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:199.0/255.0 green:189.0/255.0 blue:45.0/255.0 alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:70.0/255.0  green:11.0/255.0  blue:75.0/255.0 alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:141.0/255.0 green:149.0/255.0 blue:0.0/255.0  alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:59.0/255.0  green:61.0/255.0  blue:0.0/255.0  alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:163.0/255.0 green:0.0/255.0   blue:27.0/255.0 alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:78.0/255.0  green:53.0/255.0  blue:58.0/255.0 alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:135.0/255.0 green:52.0/255.0  blue:82.0/255.0 alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:47.0/255.0  green:16.0/255.0  blue:21.0/255.0 alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:119.0/255.0 green:19.0/255.0  blue:9.0/255.0  alpha:1.0]];
        [paletteThree addObject: [UIColor colorWithRed:175.0/255.0 green:83.0/255.0  blue:0.0/255.0  alpha:1.0]];
        
        //gradate
        
        NSMutableArray *paletteFour = [NSMutableArray array];
        
        [paletteFour addObject: [UIColor colorWithRed:196.0/255.0 green:137.0/255.0 blue:255.0/255.0 alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:255.0/255.0 green:89.0/255.0  blue:0.0/255.0   alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:134.0/255.0 green:216.0/255.0 blue:27.0/255.0  alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:170.0/255.0 green:224.0/255.0 blue:251.0/255.0 alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:131.0/255.0 green:39.0/255.0  blue:224.0/255.0 alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:212.0/255.0 green:13.0/255.0  blue:14.0/255.0  alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:7.0/255.0   green:165.0/255.0 blue:55.0/255.0  alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:0.0/255.0   green:165.0/255.0 blue:240.0/255.0 alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:70.0/255.0  green:0.0/255.0   blue:150.0/255.0 alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:148.0/255.0 green:0.0/255.0   blue:32.0/255.0  alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:3.0/255.0   green:115.0/255.0 blue:85.0/255.0  alpha:1.0]];
        [paletteFour addObject: [UIColor colorWithRed:0.0/255.0   green:69.0/255.0  blue:113.0/255.0 alpha:1.0]];
        
        // playful
        
        NSMutableArray *paletteFive = [NSMutableArray array];
        
        [paletteFive addObject: [UIColor colorWithRed:136.0/255.0 green:0.0/255.0   blue:171.0/255.0 alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:190.0/255.0 green:0.0/255.0   blue:0.0/255.0   alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:240.0/255.0 green:66.0/255.0  blue:0.0/255.0   alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:244.0/255.0 green:220.0/255.0 blue:0.0/255.0   alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:20.0/255.0  green:88.0/255.0  blue:110.0/255.0 alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:214.0/255.0 green:0.0/255.0   blue:145.0/255.0 alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:53.0/255.0  green:181.0/255.0 blue:26.0/255.0  alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:195.0/255.0 green:228.0/255.0 blue:0.0/255.0   alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:0.0/255.0   green:0.0/255.0   blue:209.0/255.0 alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:64.0/255.0  green:0.0/255.0   blue:130.0/255.0 alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:0.0/255.0   green:102.0/255.0 blue:199.0/255.0 alpha:1.0]];
        [paletteFive addObject: [UIColor colorWithRed:8.0/255.0   green:156.0/255.0 blue:109.0/255.0 alpha:1.0]];
        
        //spicy
        
        NSMutableArray *paletteSix = [NSMutableArray array];
        
        [paletteSix addObject: [UIColor colorWithRed:53.0/255.0  green:15.0/255.0  blue:70.0/255.0  alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:78.0/255.0  green:23.0/255.0  blue:20.0/255.0  alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:163.0/255.0 green:0.0/255.0   blue:27.0/255.0  alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:241.0/255.0 green:225.0/255.0 blue:0.0/255.0   alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:81.0/255.0  green:0.0/255.0   blue:117.0/255.0 alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:244.0/255.0 green:81.0/255.0  blue:0.0/255.0   alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:239.0/255.0 green:0.0/255.0   blue:47.0/255.0  alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:157.0/255.0 green:206.0/255.0 blue:0.0/255.0   alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:109.0/255.0 green:34.0/255.0  blue:182.0/255.0 alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:253.0/255.0 green:166.0/255.0 blue:41.0/255.0  alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:253.0/255.0 green:97.0/255.0  blue:78.0/255.0  alpha:1.0]];
        [paletteSix addObject: [UIColor colorWithRed:30.0/255.0  green:111.0/255.0 blue:9.0/255.0   alpha:1.0]];
        
        //warm
        
        NSMutableArray *paletteSeven = [NSMutableArray array];
        
        [paletteSeven addObject: [UIColor colorWithRed:173.0/255.0 green:177.0/255.0 blue:76.0/255.0  alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:123.0/255.0 green:122.0/255.0 blue:42.0/255.0  alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:149.0/255.0 green:107.0/255.0 blue:126.0/255.0 alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:235.0/255.0 green:174.0/255.0 blue:121.0/255.0 alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:209.0/255.0 green:60.0/255.0  blue:57.0/255.0  alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:144.0/255.0 green:90.0/255.0  blue:48.0/255.0  alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:212.0/255.0 green:115.0/255.0 blue:54.0/255.0  alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:240.0/255.0 green:213.0/255.0 blue:90.0/255.0  alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:160.0/255.0 green:0.0/255.0   blue:52.0/255.0  alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:87.0/255.0  green:40.0/255.0  blue:30.0/255.0  alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:166.0/255.0 green:154.0/255.0 blue:135.0/255.0 alpha:1.0]];
        [paletteSeven addObject: [UIColor colorWithRed:239.0/255.0 green:228.0/255.0 blue:164.0/255.0 alpha:1.0]];
        
        allPalettes = [[NSMutableArray alloc] init];
        [allPalettes addObjectsFromArray:[NSArray arrayWithObjects:paletteOne, paletteTwo, paletteThree, paletteFour, paletteFive, paletteSix, paletteSeven, nil]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Palette Selection"];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}

- (IBAction)paletteButtonPressed:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    paletteChosen = [allPalettes objectAtIndex:buttonPressed.tag];
    
    for (UIButton *button in [self.view subviews])
    {
        if (button == buttonPressed)
        {
            button.layer.borderWidth = 2.0f;
            button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
        else
        {
            button.layer.borderWidth = 0.0f;
        }
    }
    
    ColourSelectionViewController* colourSelectionViewController = [[ColourSelectionViewController alloc] initWithNibName:@"ColourSelectionViewController" bundle:[NSBundle mainBundle]];
    colourSelectionViewController.paletteChosen = paletteChosen;
    [[self navigationController] pushViewController:colourSelectionViewController animated:YES];
}

- (IBAction)selectRandomPalette:(id)sender
{
    int randomPalette = arc4random_uniform([allPalettes count]);
    paletteChosen = [allPalettes objectAtIndex:randomPalette];
    for (UIButton *button in [self.view subviews])
    {
        if (button.tag == randomPalette)
        {
            button.layer.borderWidth = 2.0f;
            button.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
        }
        else
        {
            button.layer.borderWidth = 0.0f;
        }
    }
    
    ColourSelectionViewController* colourSelectionViewController = [[ColourSelectionViewController alloc] initWithNibName:@"ColourSelectionViewController" bundle:[NSBundle mainBundle]];
    colourSelectionViewController.paletteChosen = paletteChosen;
    [[self navigationController] pushViewController:colourSelectionViewController animated:YES];
}
@end