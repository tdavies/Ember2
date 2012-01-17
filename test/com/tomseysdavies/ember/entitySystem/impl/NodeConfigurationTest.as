package com.tomseysdavies.ember.entitySystem.impl
{
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	
	import flexunit.framework.Assert;
	
	import mocks.MockComponentA;
	import mocks.MockComponentB;
	import mocks.MockNode;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.collection.hasItems;
	import org.swiftsuspenders.Injector;
	
	public class NodeConfigurationTest
	{		
		private var _nodeconfig:NodeConfiguration;
		private var _entitySystem:EntityManager;
		
		[Before]
		public function setUp():void
		{
			_entitySystem = new EntityManager(new Injector());
			_nodeconfig = new NodeConfiguration(MockNode);
		}
		
		[After]
		public function tearDown():void
		{
			_nodeconfig = null;
		}
		
		[Test]
		public function test_does_entity_have_components():void
		{
			var e:IEntity = _entitySystem.create();
			e.add(new MockComponentA());			
			e.add(new MockComponentB());
			assertTrue(	_nodeconfig.doesEntityHaveComponents(e));
		}
		
		[Test]
		public function create_node():void
		{
			var e:IEntity = _entitySystem.create();
			var a:MockComponentA = new MockComponentA();
			a.n = 5;
			e.add(a);			
			e.add(new MockComponentB());
			
			var node:MockNode = _nodeconfig.createNode(e) as MockNode;
			assertTrue(node.mockComponentA.n == 5);
		}
	}
}