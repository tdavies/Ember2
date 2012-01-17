package com.tomseysdavies.ember.io
{
	import mocks.MockComponentA;

	import org.hamcrest.assertThat;
	import org.hamcrest.collection.array;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.collection.hasItems;
	import org.hamcrest.object.equalTo;

	public class ComponentConfigTests
	{
		
		[Test]
		public function config_generates_list_of_properties():void
		{
			var config:ComponentConfig = new ComponentConfig("Mock", new MockComponentA());
			assertThat(config.properties, hasItem("n"));
		}
		/*
		[Test]
		public function can_reference_base_types_via_config():void
		{
			var config:ComponentConfig = new ComponentConfig("Mock", new MockTypesComponent());
			assertThat(config.getType("arr"), equalTo("Array"));
		}
		
		[Test]
		public function can_reference_packaged_types_via_config():void
		{
			var config:ComponentConfig = new ComponentConfig("Mock", new MockTypesComponent());
			assertThat(config.getType("point"), equalTo("flash.geom::Point"));
		}
		
		[Test]
		public function config_ignores_properties_without_Ember_metadata():void
		{
			var config:ComponentConfig = new ComponentConfig("Mock", new MockMetadataComponent());
			assertThat(config.properties, array("a"));
		}
		*/
		
	}
}
