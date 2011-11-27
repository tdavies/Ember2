package com.tomseysdavies.ember.entitySystem.impl
{
	
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.api.IEntities;
	import com.tomseysdavies.ember.entitySystem.api.IFamily;
	
	import flexunit.framework.Assert;
	
	import mocks.MockComponentA;
	import mocks.MockComponentB;
	import mocks.MockNode;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.collection.hasItems;
	import org.swiftsuspenders.Injector;
	
	public class EntitySystemTest
	{		
		private static const NAME:String = "testName";
		
		private var system:IEntities;
		private var injector:Injector;
		
		[Before]
		public function setUp():void
		{
			injector = new Injector();
			system = new Entities(injector);
		}
		
		[After]
		public function tearDown():void
		{
			system = null;
		}
		
		[Test]
		public function can_create_entity():void
		{
			var entity:IEntity = system.create();
			assertTrue(system.contains(entity));
		}
		
		[Test]
		public function can_create_a_named_entity():void
		{
			var entity:IEntity = system.create(NAME);
			assertNotNull(system.get(NAME));
		}
		
		[Test]
		public function can_remove_entity():void
		{
			var entity:IEntity = system.create();
			system.remove(entity);
			assertFalse(system.contains(entity));
		}
		
		
		[Test]
		public function can_get_all_entities():void
		{
			var a:IEntity = system.create();
			var b:IEntity = system.create();
			assertThat(system.getAll(), hasItems(a, b));
		}

		[Test]
		public function all_entities_can_be_removed():void
		{
			var a:IEntity = system.create();
			system.removeAll();
			assertTrue(system.getAll().length ==0);
		}
		
		[Test]
		public function can_get_family():void
		{
			var family:IFamily = system.requestFamiliy(MockNode);
			assertNotNull(family);
		}
		
		[Test]
		public function qualifying_entities_are_added_to_family():void
		{
			var family:IFamily = system.requestFamiliy(MockNode);
			
			var a:IEntity = system.create();
			a.add(new MockComponentA());
			a.add(new MockComponentB());
			
			var nodes:Vector.<MockNode> = family.nodes as Vector.<MockNode>;
			assertTrue(nodes[0].entity === a);
		}
		
		[Test]
		public function entities_are_removed_from_family():void
		{
			var family:IFamily = system.requestFamiliy(MockNode);
			
			var a:IEntity = system.create();
			a.add(new MockComponentA());
			a.add(new MockComponentB());
			
			a.remove(MockComponentB);
			var nodes:Vector.<MockNode> = family.nodes as Vector.<MockNode>;
			assertTrue(nodes.length == 0);
		}
		
		[Test]
		public function family_includes_qualifying_entities_when_created():void
		{
			var a:IEntity = system.create();
			a.add(new MockComponentA());
			a.add(new MockComponentB());
			
			var family:IFamily = system.requestFamiliy(MockNode);
			
			var nodes:Vector.<MockNode> = family.nodes as Vector.<MockNode>;
			assertTrue(nodes[0].entity === a);
		}
		
		[Test]
		public function is_node_vecotor_avalible_for_injjection():void
		{
			var family:IFamily = system.requestFamiliy(MockNode);
			var a:IEntity = system.create();
			a.add(new MockComponentA());
			a.add(new MockComponentB());
			
			var type:Class = Vector.<MockNode> as Class;
			var nodes:Vector.<MockNode> = injector.getInstance(type);
			assertTrue(nodes[0].entity === a);
		}
	}
}