package com.tomseysdavies.ember.io.serialise.json
{
	
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.api.IEntityManager;
	import com.tomseysdavies.ember.io.EntityEncoder;
import com.tomseysdavies.ember.io.serialise.ISerialiser;

public class JsonSerialiser implements ISerialiser
	{
		private var _entityEncoder:EntityEncoder;
		
		
		public function JsonSerialiser()
		{
			_entityEncoder = new EntityEncoder();
		}
		
		public function serialise(entityManager:IEntityManager):String{
			var entities:Vector.<IEntity> =  entityManager.getAll();
			var entityList:Array = [];
			for each(var entity:IEntity in entities){				
				var encoded:Object = _entityEncoder.encode(entity);
				entityList.push(encoded);
			}
			return JSON.stringify(entityList);
		}
		
		public function deserialise(data:String,entityManager:IEntityManager):void{
			var entityList:Array = JSON.parse(data) as Array;

			for each(var entityData:Object in entityList){
				_entityEncoder.decode(entityManager,entityData);
			}
		}
	}
}