package com.tomseysdavies.ember.entitySystem
{
	
	import com.tomseysdavies.ember.entitySystem.api.IEntityManager;
	import com.tomseysdavies.ember.entitySystem.api.ISystemManager;
	import com.tomseysdavies.ember.entitySystem.impl.EntityManager;
	import com.tomseysdavies.ember.entitySystem.impl.SystemManager;
	
	import robotlegs.bender.core.api.IContext
	import robotlegs.bender.core.api.IContextExtension;
	
	public class EntitySystemExtension implements IContextExtension
	{
		public function EntitySystemExtension()
		{
		}
		
		public function install(context:IContext):void{
			var entitySystem:IEntityManager =  new EntityManager(context.injector);
			context.injector.map(IEntityManager).toValue(entitySystem);
			var systems:ISystemManager = new SystemManager(context.injector);
			context.injector.map(ISystemManager).toValue(systems);
		}
		
		public function initialize():void{
			
		}
		
		public function uninstall():void{
			
		}
		

	}
}