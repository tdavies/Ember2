package com.tomseysdavies.ember.entitySystem.impl
{
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.api.IFamily;
	
	import flash.utils.Dictionary;
	
	import org.swiftsuspenders.Injector;

	final internal class Families
	{
		
		private var _entitySystem:Entities;
		private var _familiyMap:Dictionary = new Dictionary();
		private var _componentFamiliyMap:ComponentFamiliyMap = new ComponentFamiliyMap();
		private var _injector:Injector;
		
		public function Families(entitySystem:Entities,injector:Injector)
		{
			_injector = injector;
			_entitySystem = entitySystem;
			_entitySystem.entityComponentAdded.add(onEntityComponentAdded);
			_entitySystem.entityComponentRemoved.add(onEntityComponentRemoved);
		}
		
		public function get(nodeClass:Class):IFamily{
			return _familiyMap[nodeClass] ||= createFamiliy(nodeClass);
		}
		
		private function createFamiliy(nodeClass:Class):IFamily{
			var familiy:Familiy = new Familiy(nodeClass,_injector);
			_componentFamiliyMap.add(familiy.config.components,familiy);
			for each(var entity:IEntity in _entitySystem.entities){
				if(familiy.config.doesEntityHaveComponents(entity)){
					familiy.addEntity(entity);
				}
			}
			return familiy;
		}
		
		private function onEntityComponentAdded(entity:Entity, component:Class):void
		{
			var families:Vector.<Familiy> =  _componentFamiliyMap.getFamiliesWithComponent(component);
			for each(var familiy:Familiy in families){
				if(familiy.config.doesEntityHaveComponents(entity)){
					familiy.addEntity(entity);
				}
			}
		}
		
		private function onEntityComponentRemoved(entity:Entity, component:Class):void
		{
			var families:Vector.<Familiy> =  _componentFamiliyMap.getFamiliesWithComponent(component);
			for each(var familiy:Familiy in families){
				familiy.removeEntity(entity);
			}
		}
		
		
		
	}
}