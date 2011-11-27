package com.tomseysdavies.ember.entitySystem.impl
{

	import com.tomseysdavies.ember.entitySystem.api.ISystem;
	import com.tomseysdavies.ember.entitySystem.api.ISystems;
	
	import flash.utils.Dictionary;
	
	import org.swiftsuspenders.Injector;
	
	final public class Systems implements ISystems
	{
		private var _injector:Injector;
		private var _systems:Dictionary;
		
		public function Systems(injector:Injector)
		{
			_injector = injector;
			_systems = new Dictionary();
		}
		
		public function add(systemClass:Class):ISystem
		{
			var system:ISystem = _systems[systemClass] as ISystem;
			if (system)	throw new Error("System "+ systemClass  +"already registered");
			system = new systemClass();
			_injector.injectInto(system);
			_systems[systemClass] = system;
			system.initialize();
			return system;
		}

		public function has(systemClass:Class):Boolean
		{
			return _systems[systemClass] != null;
		}

		public function get(systemClass:Class):ISystem
		{
			return _systems[systemClass];
		}

		public function remove(systemClass:Class):Boolean
		{
			var system:ISystem = _systems[systemClass] as ISystem;
			if (!system)
				return false;
			
			delete _systems[systemClass];
			
			system.destroy();
			return true;
		}
		
	}
}
