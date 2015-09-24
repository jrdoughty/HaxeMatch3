import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import Map;

class Gem extends Sprite 
{
    public var numImage: Int = 0;
    public var direction: String = "";
    public var sprite: Sprite;
    public var neighborNodes:Map<String,Gem>;
    public var x: Int;
    public var y: Int;
    public static inline var VERTICAL:Bool = true;
    public static inline var HORIZONTAL:Bool = false;

    public function new (numImage: Int, xCord: Int, yCord: Int, direction: String)
    {
        super({
            pos: new Vector(xCord * Main.GEMIMAGESIZE + Main.GEMIMAGESIZE / 2, 
                yCord * Main.GEMIMAGESIZE + Main.GEMIMAGESIZE / 2),
            texture : Luxe.resources.texture('img/gem' + numImage + '.png'),
            depth : 4,
            size: new Vector(Main.GEMIMAGESIZE, Main.GEMIMAGESIZE)
        });
        this.numImage = numImage;
        this.x = xCord;
        this.y = yCord;
        this.direction = direction;
        
    }

    public function validateMove(gem:Gem):Array<Gem>
    {
        var gemsInARowMap:Map<String, Array<Gem>>;
        var directions: Array<String> = [Main.RIGHT, Main.LEFT, Main.UP, Main.DOWN];
        var result: Array<Gem> = [];
        var horizontal: Array<Gem> = [];
        var vertical: Array<Gem> = [];
        var i: Int = 0;
        gemsInARowMap = new Map();

        for(i in directions)
        {
            gemsInARowMap.set(i, checkDirection(gem, i));
        }

        horizontal = gemsInARowMap[Main.RIGHT].concat(gemsInARowMap[Main.LEFT]);
        vertical = gemsInARowMap[Main.UP].concat(gemsInARowMap[Main.DOWN]);
        
        if(horizontal.length >= Main.MININAROW - 1)
        {
            result = result.concat(horizontal);
        }
        if(vertical.length >= Main.MININAROW - 1)
        {
            result = result.concat(vertical);
        }
        if(result.length != 0)
        {
            result.push(this);
        }
        
        return (result);
    }

    public function checkDirection(gem:Gem, key:String):Array<Gem>
    {
        var result:Array<Gem> = [];
        var temp;
        if(gem.neighborNodes.exists(key))
        {
            if(gem.neighborNodes[key] != this && gem.neighborNodes[key].numImage == numImage)
            {
                result.push(gem.neighborNodes[key]);
                result = result.concat(checkDirection(result[result.length - 1], key));
            }
        }

        return result;
    }

    public function getAllInDirection(direction:String):Array<Gem>
    {
        var result:Array<Gem> = [];
        var temp;
        if(neighborNodes.exists(direction))
        {
            result.push(neighborNodes[direction]);
            result = result.concat(getAllInDirection(direction));
        }

        return result;
    }

    public function swap(gem:Gem)
    {
        var oldPos = pos;
        var oldX = x;
        var oldY = y;

        pos = gem.pos;
        x = gem.x;
        y = gem.y;

        gem.pos = oldPos;
        gem.x = oldX;
        gem.y = oldY;
    }
}
