package com.poly.coffee.mapper;

import com.poly.coffee.dto.request.ViewRequest;
import com.poly.coffee.dto.response.ViewResponse;
import com.poly.coffee.entity.View;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface ViewMapper {
    
    View toView(ViewRequest request);
    ViewResponse toViewResponse(View View);
    void updateView(@MappingTarget View View, ViewRequest request);
}
