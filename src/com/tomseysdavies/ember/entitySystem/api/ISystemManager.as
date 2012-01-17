package com.tomseysdavies.ember.entitySystem.api
{
	public interface ISystemManager
	{
		function add(systemClass:Class):ISystem;
		
		function has(systemClass:Class):Boolean;
		
		function get(systemClass:Class):ISystem;
		
		function remove(systemClass:Class):Boolean;
	}
}