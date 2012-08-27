package com.kylekellogg.ld24.model.background
{
	import com.kylekellogg.ld24.model.Assets;

	public class BackgroundModel
	{
		public var collections:Vector.<BackgroundCollectionModel>;
		
		protected var _current:Vector.<BackgroundCollectionModel>;
		
		public function BackgroundModel()
		{
			collections = new Vector.<BackgroundCollectionModel>();
			current = new Vector.<BackgroundCollectionModel>();
		}
		
		public function init():void
		{
			var col1:BackgroundCollectionModel = new BackgroundCollectionModel();
			col1.add( Assets.instance.bg11 );
			col1.add( Assets.instance.bg12 );
			col1.add( Assets.instance.bg13 );
			col1.add( Assets.instance.bg14 );
			
			var col2:BackgroundCollectionModel = new BackgroundCollectionModel();
			col2.add( Assets.instance.bg21 );
			col2.add( Assets.instance.bg22 );
			col2.add( Assets.instance.bg23 );
			
			collections.push( col1, col2 );
			
			current = collections.slice( 0, 1 );
		}
		
		public function randomize():void
		{
			var clone:Vector.<BackgroundCollectionModel> = collections.slice();
			current = new Vector.<BackgroundCollectionModel>();
			while ( clone.length ) {
				var cloned:BackgroundCollectionModel = clone.splice( Math.floor( Math.random() * clone.length ), 1 )[0];
				cloned.randomize();
				current.push( cloned );
			}
		}

		public function get current():Vector.<BackgroundCollectionModel>
		{
			return _current;
		}

		public function set current(value:Vector.<BackgroundCollectionModel>):void
		{
			_current = new Vector.<BackgroundCollectionModel>();
			for ( var i:int = 0, l:int = value.length; i < l; i++ )
			{
				_current.push( value[i].clone() );
			}
		}

	}
}