package com.tomseysdavies.ember.entitySystem.impl
{
	
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.ISignalOwner;

	public final class Entity implements IEntity
	{
		private var _name:String;		
		private var _components:Dictionary;	
		private var _componentAdded:ISignalOwner;
		private var _componentRemoved:ISignalOwner;
		
		public function Entity(name:String, componentAdded:ISignalOwner, componentRemoved:ISignalOwner)
		{
			_name = name;
			_components = new Dictionary();
			_componentAdded = componentAdded;
			_componentRemoved = componentRemoved;
		}
		
		public function add(component:Object, componentClass:Class = null):void
		{
			componentClass ||= component["constructor"];
			_components[componentClass] = component;
			_componentAdded.dispatch(this, componentClass);
		}
		
		public function getAll():Dictionary
		{
			return _components;
		}
				
		public function get(componentClass:Class):Object
		{
			return _components[componentClass];
		}
		
		public function remove(componentClass:Class):void
		{
			if (_components[componentClass] == null) return;			
			delete _components[componentClass];
			_componentRemoved.dispatch(this, componentClass);
		}
		
		public function has(componentClass:Class):Boolean
		{
			return _components[componentClass] != null;
		}
		
		public function get name():String
		{
			return _name;
		}
	}
}