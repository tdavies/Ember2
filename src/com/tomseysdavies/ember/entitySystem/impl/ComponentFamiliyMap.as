package com.tomseysdavies.ember.entitySystem.impl
{
	import flash.utils.Dictionary;

	final internal class ComponentFamiliyMap
	{

		private var _map:Dictionary = new Dictionary();
		
		public function ComponentFamiliyMap()
		{
		}
		
		internal function add(components:Vector.<Class>, familiy:Familiy):void
		{
			for each (var component:Class in components){
				getFamiliesWithComponent(component).push(familiy);
			}
		}
		
		internal function getFamiliesWithComponent(component:Class):Vector.<Familiy>
		{
			return _map[component] ||= new Vector.<Familiy>();
		}
	}
}