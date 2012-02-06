/**
 * Created by IntelliJ IDEA.
 * User: tom
 * Date: 06/02/12
 * Time: 20:42
 * To change this template use File | Settings | File Templates.
 */
package com.tomseysdavies.ember.io.serialise {
import com.tomseysdavies.ember.entitySystem.api.IEntityManager;

public interface ISerialiser {

    function serialise(entityManager:IEntityManager):String;
    function deserialise(data:String,entityManager:IEntityManager):void;
}
}
