package com.kylekellogg.ld24.model
{
	import com.kylekellogg.ld24.controller.SoundController;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		public static const instance:Assets = new Assets();
		
		[Embed(source='assets/bg_beach_1.png')]
		protected var _BG11:Class;
		public var bg11:Bitmap;
		
		[Embed(source='assets/bg_beach_2.png')]
		protected var _BG12:Class;
		public var bg12:Bitmap;
		
		[Embed(source='assets/bg_beach_3.png')]
		protected var _BG13:Class;
		public var bg13:Bitmap;
		
		[Embed(source='assets/bg_beach_4.png')]
		protected var _BG14:Class;
		public var bg14:Bitmap;
		
		[Embed(source='assets/bg_dorm_1.png')]
		protected var _BG21:Class;
		public var bg21:Bitmap;
		
		[Embed(source='assets/bg_dorm_2.png')]
		protected var _BG22:Class;
		public var bg22:Bitmap;
		
		[Embed(source='assets/bg_dorm_3.png')]
		protected var _BG23:Class;
		public var bg23:Bitmap;
		
		[Embed(source='assets/platform.png')]
		protected var _Platform:Class;
		public var platform:Bitmap;
		
		[Embed(source='assets/spritesheet.xml', mimeType='application/octet-stream')]
		protected var _SpritesheetData:Class;
		
		[Embed(source='assets/spritesheet.png')]
		protected var _Spritesheet:Class;
		
		protected var _atlas:TextureAtlas;
		
		[Embed(source='assets/snd/main_loop_prefix.mp3')]
		protected var _MainLoopPrefix:Class;
		public var mainLoopPrefix:Sound;
		
		[Embed(source='assets/snd/main_loop.mp3')]
		protected var _MainLoop:Class;
		public var mainLoop:Sound;
		
		[Embed(source='assets/snd/jump.mp3')]
		protected var _Jump:Class;
		public var jump:Sound;
		
		[Embed(source='assets/snd/shoot_ice.mp3')]
		protected var _ShootIce:Class;
		public var shootIce:Sound;
		
		public var sounds:Dictionary;
		
		protected var _cached:Dictionary;
		
		public function Assets()
		{
			if ( instance )
				throw new Error( 'Assets already exists. Try grabbing it from Assets.instance.' );
			
			bg11 = new _BG11() as Bitmap;
			bg12 = new _BG12() as Bitmap;
			bg13 = new _BG13() as Bitmap;
			bg14 = new _BG14() as Bitmap;
			bg21 = new _BG21() as Bitmap;
			bg22 = new _BG22() as Bitmap;
			bg23 = new _BG23() as Bitmap;
			
			platform = new _Platform() as Bitmap;
			
			_atlas = new TextureAtlas( Texture.fromBitmap( new _Spritesheet() as Bitmap ), XML( new _SpritesheetData() ) );
			
			mainLoop = new _MainLoop() as Sound;
			jump = new _Jump() as Sound;
			shootIce = new _ShootIce() as Sound;
			mainLoopPrefix = new _MainLoopPrefix() as Sound;
			
			sounds = new Dictionary();
			sounds[ SoundController.MAIN_LOOP ] = mainLoop;
			sounds[ SoundController.JUMP ] = jump;
			sounds[ SoundController.SHOOT_ICE ] = shootIce;
			sounds[ SoundController.LOOP_PREFIX ] = mainLoopPrefix;
			
			_cached = new Dictionary();
		}
		
		public function texture( name:String ):Texture
		{
			if ( _cached[ name ] )
				return _cached[ name ];
			
			_cached[ name ] = _atlas.getTexture( name );
			return _cached[ name ];
		}
		
		public function textures( prefix:String ):Vector.<Texture>
		{
			if ( _cached[ prefix ] )
				return _cached[ prefix ];
			
			_cached[ prefix ] = _atlas.getTextures( prefix );
			return _cached[ prefix ];
		}
	}
}