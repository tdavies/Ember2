package com.tomseysdavies.ember.entitySystem.api
{
	import flash.utils.Dictionary;
	
	import org.osflash.signals.ISignalOwner;

	public interface IEntity
	{
		
		function add(component:Object, componentClass:Class = null):void;
		
		function getAll():Dictionary;
			
		function get(componentClass:Class):Object;
		
		function remove(componentClass:Class):void;
		
		function has(componentClass:Class):Boolean;
		
		function get name():String;
	}
}