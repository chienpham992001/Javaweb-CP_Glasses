package com.devpro.javaweb21Version02.services;

import com.devpro.javaweb21Version02.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
