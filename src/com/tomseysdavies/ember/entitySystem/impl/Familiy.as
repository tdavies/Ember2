
package com.tomseysdavies.ember.entitySystem.impl
{
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.api.IFamily;
	import com.tomseysdavies.utils.VectorMap;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.swiftsuspenders.Injector;

	final internal class Familiy implements IFamily
	{
		
		private var _nodes:VectorMap
		private var _entityAddedSignal:Signal = new Signal(Node);
		private var _entityRemovedSignal:Signal = new Signal(Node);
		private var _config:NodeConfiguration;
		private var _entityNodeMap:Dictionary = new Dictionary();
		private var _injector:Injector;
		
		public function Familiy(nodeClass:Class,injector:Injector)
		{
			_injector = injector;
			_config =  new NodeConfiguration(nodeClass);
			_nodes = new VectorMap(nodeClass);
			_injector.map(_nodes.vectorClass).toValue(_nodes.vector);
		}
		
		internal function addEntity(entity:IEntity):void
		{
			const node:Node = config.createNode(entity);
			_nodes.add(node);
			_entityNodeMap[entity] = node;
			_entityAddedSignal.dispatch(node);
		}
		
		internal function removeEntity(entity:IEntity):void
		{
			const node:Node = _entityNodeMap[entity];
			_nodes.remove(node);
			_entityRemovedSignal.dispatch(node);
			delete _entityNodeMap[entity];
		}
		
		public function get entityAddedSignal():ISignal
		{
			return _entityAddedSignal;
		}
		
		public function get entityRemovedSignal():ISignal
		{
			return _entityRemovedSignal;
		}
		
		internal function get config():NodeConfiguration
		{
			return _config;
		}
		
		public function get nodes():*
		{
			return _nodes.vector;
		}
			
	}
}