package;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;
import luxe.Input;

class Main extends luxe.Game
{
    private var activeBoard: Board;
    private var score: Int;

    public static inline var BOARDWIDTH: Int = 8; // how many columns in the board
    public static inline var BOARDHEIGHT: Int = 8; // how many rows in the board
    public static inline var GEMIMAGESIZE: Int = 64; // width & height of each space in pixels
 
    public static inline var NUMGEMIMAGES: Int = 8;
    public static inline var NUMMATCHSOUNDS: Int = 6;
    public static inline var MOVERATE: Int = 25; // 1 to 100, larger num means faster animations
    public static inline var DEDUCTSPEED: Float = 0.8; //// reduces score by 1 point every DEDUCTSPEED seconds.

    public static var PURPLE: Color = new Color(255, 0, 255, 1);
    public static var LIGHTBLUE: Color = new Color(170, 190, 255, 1);
    public static var BLUE: Color = new Color(0, 0, 255, 1);
    public static var RED: Color = new Color(255, 100, 100, 1);
    public static var BLACK: Color = new Color(0, 0, 0, 1);
    public static var BROWN: Color = new Color(85, 65, 0, 1);
    //public static inline var HIGHLIGHTCOLOR: Color = PURPLE; // color of the selected gem's border
    //public static inline var BGCOLOR: Color = LIGHTBLUE; // background color on the screen
    //public static inline var GRIDCOLOR: Color = BLUE; // color of the game board
    //public static inline var GAMEOVERCOLOR: Color = RED; // color of the "Game over" text.
    //public static inline var GAMEOVERBGCOLOR: Color = BLACK; // background color of the "Game over" text.
    //public static inline var SCORECOLOR: Color = BROWN; // color of the text for the player's score

    //public static inline var XMARGIN: Int = int((WINDOWWIDTH - GEMIMAGESIZE * BOARDWIDTH) / 2);
    //public static inline var YMARGIN: Int = int((WINDOWHEIGHT - GEMIMAGESIZE * BOARDHEIGHT) / 2);

    public static inline var UP: String = 'up';
    public static inline var DOWN: String = 'down';
    public static inline var LEFT: String = 'left';
    public static inline var RIGHT: String = 'right';

    override function ready()
    {
        newGame();
        /*
        var player = new Sprite({
            texture : Luxe.resources.texture('img/gem0.png'),
            pos : Luxe.screen.mid,
            depth : 4
        });*/
    }

    public function newGame():Void
    {
        activeBoard = new Board();
        score = 0;
    }


    override function onkeyup( e:KeyEvent ) {

       //called by luxe for you, when a key is released

       if(e.keycode == Key.escape) {
          Luxe.shutdown();
       }

    } //onkeyup
    override function onmouseup( event:MouseEvent ) 
    {
        if(event.button == MouseButton.left)
            activeBoard.onMouseUp(event.pos);
    }

    override function update(dt:Float) {

       //called by luxe for you, each frame, and passes in the
       //delta time (the length in seconds of the last frame).

    } //update


    override function config( config:luxe.AppConfig ) {
        var i: Int;
        for(i in 0...NUMGEMIMAGES)
            config.preload.textures.push({ id:'img/gem'+i+'.png' });

        return config;

    } //config
}//Main