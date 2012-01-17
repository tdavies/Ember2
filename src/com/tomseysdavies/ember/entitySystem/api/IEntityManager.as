package com.tomseysdavies.ember.entitySystem.api
{
	import org.osflash.signals.Signal;

	public interface IEntityManager
	{
		function create(name:String=null):IEntity;
		function get(name:String):IEntity;
		function getAll():Vector.<IEntity>;
		function contains(entity:IEntity):Boolean;
		function remove(entity:IEntity):void
		function removeAll():void;
		function requestFamiliy(nodeClass:Class):IFamily;
	}	
	
}