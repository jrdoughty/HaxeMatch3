using Std;
import luxe.Sprite;
import phoenix.Vector;

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

            /*gems.push(new Sprite({
            pos: Luxe.screen.mid,//new Vector(x * 128, y * 128),
            texture : Luxe.resources.texture('img/gem'+numImage+'.png'),
            depth : 0
        }));*/
        }
    }

}