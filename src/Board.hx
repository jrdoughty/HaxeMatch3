using Std;
import luxe.Input;
import luxe.Vector;
import luxe.Color;

class Board 
{
    public var gems: Array<Gem> = new Array();
    public var selectedGems: Array<Gem> = new Array();
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
        for (i in 0...gems.length) 
        {
            buildNeighbors(gems[i]);
        }
    }

    public function onMouseUp(pos:Vector)
    {
        var i: Int = 0;
        var x: Float = (pos.x) - pos.x % Main.GEMIMAGESIZE;
        var y: Float = (pos.y) - pos.y % Main.GEMIMAGESIZE;
        x = x / Main.GEMIMAGESIZE;
        y = y / Main.GEMIMAGESIZE;
        
        for (i in 0...gems.length) {
            if(gems[i].x == x && gems[i].y == y)
            {
                gems[i].color = new Color().rgb(0xdddddd);
                selectedGems.push(gems[i]);
                break;
            }
        }

        if(selectedGems.length == 2)
        {
            var oldPosofFirst = new Vector(selectedGems[0].x,selectedGems[0].y);
            if(selectedGems[0].validateMove(selectedGems[1]) ||
                selectedGems[1].validateMove(selectedGems[0]))
            {
                selectedGems[0].swap(selectedGems[1].x,selectedGems[1].y);
                selectedGems[1].swap(cast(oldPosofFirst.x, Int),cast(oldPosofFirst.y, Int));
            }
            buildNeighbors(selectedGems[0]);
            buildNeighbors(selectedGems[1]);
            selectedGems[0].color = new Color().rgb(0xffffff);
            selectedGems[1].color = new Color().rgb(0xffffff);
            selectedGems = new Array();
        }
    }

    public function buildNeighbors(gem:Gem)
    {
        gem.neighborNodes = new Array();
        for (i in 0...gems.length) 
        {
            if((gem.x >= gems[i].x - 1 && gem.x <= gems[i].x + 1 && gem.y == gems[i].y ||
               gem.y >= gems[i].y - 1 && gem.y <= gems[i].y + 1 && gem.x == gems[i].x) && gem != gems[i])
            {
                gem.neighborNodes.push(gems[i]);
            }
        }
    }

}