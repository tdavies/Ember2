package com.tomseysdavies.ember.entitySystem.impl
{
	internal final class Property
	{
		
		public var name:String;
		public var componentClass:Class;
		
		public function Property(name:String,componentClass:Class)
		{
			this.name = name;
			this.componentClass = componentClass;
		}
	}
}