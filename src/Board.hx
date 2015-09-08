using Std;
import luxe.Sprite;
import luxe.Input;
import luxe.Vector;
import luxe.Color;

class Board 
{
    public var gems: Array<Sprite> = new Array();
    public function new()
    {
        var i: Int;
        var x: Int;
        var y: Int;
        var numImage: Int;
        for (i in 0...Main.BOARDWIDTH * Main.BOARDHEIGHT)
        {
            x = i % Main.BOARDWIDTH;
            y = Math.floor(i / Main.BOARDWIDTH);
            numImage = Math.floor(Math.random() * Main.NUMGEMIMAGES);
            gems.push(new Gem(numImage, x, y, "down"));
        }
    }

    public function onMouseUp(pos:Vector)
    {
        var x: Float = (pos.x) - pos.x % Main.GEMIMAGESIZE;
        var y: Float = (pos.y) - pos.y % Main.GEMIMAGESIZE;
        x = x / Main.GEMIMAGESIZE;
        y = y / Main.GEMIMAGESIZE;
        var indexFloat:Float = x + y * Main.BOARDWIDTH;
        var index:Int = Math.floor(indexFloat);
        gems[index].color = new Color().rgb(0xf94b04);
    }

}