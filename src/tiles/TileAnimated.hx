package tiles;
import openfl.display.Tile;

/**
 * An animated tile
 */
class TileAnimated extends TileBase
{
	private var types:Array<Int>;
	private var frameTime:Int;

	private var typeIndex = 0;
	private var currentFrameTime:Int = 0;
	
	public function new(x:Float, y:Float, frameTime:Int, types:Array<Int>)
	{
		super(x, y, types[typeIndex]);

		this.frameTime = frameTime;
		this.types = types;
	}

	public override function update()
	{
		currentFrameTime++;

		if (currentFrameTime >= frameTime)
		{
			typeIndex = (typeIndex + 1) % (types.length - 1);
			currentFrameTime = 0;

			id = types[typeIndex];
		}
	}
	
	public override function createNew():TileBase {
		var tile = new TileAnimated (x, y, frameTime, types);
		tile.matrix = matrix.clone ();
		tile.tileset = tileset;
		return tile;
	}
}