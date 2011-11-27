package com.tomseysdavies.ember.entitySystem.impl
{
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.api.IEntities;
	import com.tomseysdavies.ember.entitySystem.api.IFamily;
	import com.tomseysdavies.utils.VectorMap;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	import org.swiftsuspenders.Injector;
	
	final public class Entities implements IEntities
	{
		private const _entityMap:VectorMap = new VectorMap(IEntity);
		private var _nameMap:Dictionary = new Dictionary();
		private const _entityComponentAdded:Signal = new Signal(IEntity, Class);
		private const _entityComponentRemoved:Signal = new Signal(IEntity, Class);
		private var _families:Families;
		
		public function Entities(injector:Injector)
		{
			_families = new Families(this,injector);
		}
		
		public function create(name:String=""):IEntity
		{
			var entity:IEntity = new Entity(name, _entityComponentAdded, _entityComponentRemoved);
			
			if (name != "")
			{
				var existing:IEntity = _nameMap[name];
				if (existing != null)
					throw new Error("You cannot call two entities the same name");
				
				_nameMap[name] = entity;
			}
			
			_entityMap.add(entity);
			
			return entity;
		}
		
		public function get(name:String):IEntity
		{
			return _nameMap[name];
		}
		
		public function getAll():Vector.<IEntity>
		{
			return _entityMap.vector as Vector.<IEntity>;
		}
		
		public function contains(entity:IEntity):Boolean
		{
			return _entityMap.hasItem(entity);
		}
		
		public function remove(entity:IEntity):void
		{
			delete _nameMap[entity.name];
			_entityMap.remove(entity);
		}
		
		public function removeAll():void
		{
			_entityMap.removeAll();
		}
		
		public function requestFamiliy(nodeClass:Class):IFamily{
			return _families.get(nodeClass);
		}
		
		public function get entities():Vector.<IEntity>{
			return _entityMap.vector as Vector.<IEntity>;
		}
		
		internal function get entityComponentAdded():Signal
		{
			return _entityComponentAdded;
		}
		
		internal function get entityComponentRemoved():Signal
		{
			return _entityComponentRemoved;
		}
	}
}