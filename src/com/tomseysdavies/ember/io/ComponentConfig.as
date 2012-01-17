package com.tomseysdavies.ember.io
{
	import flash.utils.describeType;
	
	final internal class ComponentConfig
	{
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
			for each (var xml:XML in list)
			{	
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
