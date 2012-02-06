package com.tomseysdavies.ember.io
{
	import flash.utils.describeType;
	
	final internal class ComponentConfig
	{
        private static const META_DATA:String = "Ember";
        private static const META_ARG_SKIP:String = "skip";
		private var _type:String;
		private var _properties:Vector.<String>;
		private var _typeMap:Object;
		
		public function ComponentConfig(type:String, component:Object)
		{
			_type = type;
			_properties = new Vector.<String>();
			_typeMap = {};
			
			var description:XML = describeType(component);

			var list:XMLList = description.variable;
			list += description.accessor.(@access == "readwrite");
			for each (var xml:XML in list)
			{
                var metaData:XML = xml.metadata.(@name == META_DATA)[0];
                if(metaData){
                    var skipArg:XMLList = metaData.arg.(@key == META_ARG_SKIP);
                    if(skipArg.length() > 0){
                        if( skipArg[0].@value == "true") continue;
                    }
                }
				var property:String = xml.@name;
				_properties.push(property);
				_typeMap[property] = xml.@type.toString();
			}
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function get properties():Vector.<String>
		{
			return _properties;
		}

		public function getType(property:String):String
		{
			return _typeMap[property];
		}
		
	}
}
