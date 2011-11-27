package com.tomseysdavies.ember.entitySystem.api
{
	import com.tomseysdavies.ember.entitySystem.impl.Node;
	
	import org.osflash.signals.ISignal;

	public interface IFamily
	{
		function get entityAddedSignal():ISignal;
		
		function get entityRemovedSignal():ISignal;
		
		function get nodes():*;
	}
}