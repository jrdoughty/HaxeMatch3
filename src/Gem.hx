import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

class Gem extends Sprite 
{
    public var numImage: Int = 0;
    public var direction: String = "";
    public var sprite: Sprite;
    public var neighborNodes:Array<Gem>;
    public var x: Int;
    public var y: Int;

    public function new (numImage: Int, xCord: Int, yCord: Int, direction: String)
    {
        super({
            pos: new Vector(xCord * Main.GEMIMAGESIZE + Main.GEMIMAGESIZE / 2, yCord * Main.GEMIMAGESIZE + Main.GEMIMAGESIZE / 2),
            texture : Luxe.resources.texture('img/gem' + numImage + '.png'),
            depth : 4,
            size: new Vector(Main.GEMIMAGESIZE, Main.GEMIMAGESIZE)
        });
        this.numImage = numImage;
        this.x = xCord;
        this.y = yCord;
        this.direction = direction;
        
    }

    public function validateMove(neighbor:Gem):Bool
    {
        var result = false;
        if(neighborNodes.indexOf(neighbor) != -1 )
        {
            for (i in 0...neighbor.neighborNodes.length) 
            {
                if(numImage == neighbor.neighborNodes[i].numImage && neighbor.neighborNodes[i] != this)
                {
                    result = true;
                    break;
                }
            }
        }
        //trace(neighbors.length);
        return result;
    }

    public function swap(x:Int, y:Int)
    {
        pos = new Vector(x * Main.GEMIMAGESIZE + Main.GEMIMAGESIZE / 2, y * Main.GEMIMAGESIZE + Main.GEMIMAGESIZE / 2);
        this.x = x;
        this.y = y;
    }

}
