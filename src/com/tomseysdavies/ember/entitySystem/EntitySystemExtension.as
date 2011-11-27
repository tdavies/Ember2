package com.tomseysdavies.ember.entitySystem
{
	
	import com.tomseysdavies.ember.entitySystem.api.IEntities;
	import com.tomseysdavies.ember.entitySystem.api.ISystems;
	import com.tomseysdavies.ember.entitySystem.impl.Entities;
	import com.tomseysdavies.ember.entitySystem.impl.Systems;
	
	import org.robotlegs.v2.core.api.IContext;
	import org.robotlegs.v2.core.api.IContextExtension;
	
	public class EntitySystemExtension implements IContextExtension
	{
		public function EntitySystemExtension()
		{
		}
		
		public function install(context:IContext):void{
			var entitySystem:IEntities =  new Entities(context.injector);
			context.injector.map(IEntities).toValue(entitySystem);
			var systems:ISystems = new Systems(context.injector);
			context.injector.map(ISystems).toValue(systems);
		}
		
		public function initialize():void{
			
		}
		
		public function uninstall():void{
			
		}
		

	}
}