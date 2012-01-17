package com.tomseysdavies.ember.io
{
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.api.IEntityManager;
	
	import flash.utils.Dictionary;

	
	final public class EntityEncoder
	{
		private var _componentEncoder:ComponentEncoder;
		
		public function EntityEncoder()
		{
			_componentEncoder = new ComponentEncoder(new ComponentConfigFactory());
		}
		
		public function encode(entity:IEntity):Object
		{
			var components:Dictionary = entity.getAll();
			
			var list:Array = [];
			for each (var component:Object in components){
				list.push(_componentEncoder.encode(component));
			}
			
			var output:Object = {components:list};
			if (entity.name)
				output.name = entity.name;
			
			return output;
		}

		public function decode(entities:IEntityManager, object:Object):IEntity
		{
			var name:String = object["name"] || "";
			
			var entity:IEntity = entities.create(name);

			var list:Object = object.components;
			for each (var component:Object in list){
				entity.add(_componentEncoder.decode(component));
			}
			
			return entity;
		}
		
	}
	
}
