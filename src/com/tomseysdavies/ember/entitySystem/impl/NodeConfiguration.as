package com.tomseysdavies.ember.entitySystem.impl
{
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;

	final internal class NodeConfiguration
	{
		
		private var _properties:Vector.<String> = new Vector.<String>();
		private var _components:Vector.<Class> = new Vector.<Class>();
		private var _componentMap:Dictionary = new Dictionary();
		private var _nodeClass:Class;
		
		public function NodeConfiguration(nodeClass:Class)
		{
			_nodeClass = nodeClass;
			var des:XML = describeType(nodeClass);
			var variables:XMLList = describeType(nodeClass).factory.variable;
			var requiredComponents:Vector.<Property> = new Vector.<Property>();
			for each (var atom:XML in variables)
			{
				if(atom.@name != "entity"){
					var componentClass:Class = getDefinitionByName(atom.@type) as Class
					add(atom.@name,componentClass);
				}
			}
		}
		
		private function add(name:String, component:Class):void
		{
			_properties.push(name);
			_components.push(component);
			_componentMap[component] = name;
		}
		
		
		public function doesEntityHaveComponents(entity:IEntity):Boolean
		{
			for each(var componentClass:Class in _components){
				if(!entity.has(componentClass)) return false;
			}
			return true;
		}
		
		public function createNode(entity:IEntity):Node
		{
			var node:Node = Node(new _nodeClass()) ;
			var size:int = _properties.length;
			for (var i:int = 0; i < _properties.length; i++)
			{
				var property:String = _properties[i];
				var component:Class = _components[i];
				var value:Object = entity.get(component);
				node[property] = value;
			}
			node.entity = entity;
			return node;
		}

		public function get components():Vector.<Class>
		{
			return _components;
		}


	}
}