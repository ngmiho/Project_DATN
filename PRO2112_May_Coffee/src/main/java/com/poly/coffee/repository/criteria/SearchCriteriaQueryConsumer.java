package com.poly.coffee.repository.criteria;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.function.Consumer;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SearchCriteriaQueryConsumer implements Consumer<SearchCriteria> {

    private CriteriaBuilder builder;
    private Predicate predicate;
    private Root root;

    @Override
    public void accept(SearchCriteria searchCriteria) {
        if (searchCriteria.getOperation().equals(">")) {
            if (root.get(searchCriteria.getKey()).getJavaType() == LocalDateTime.class) {
                predicate = builder.and(
                        predicate,
                        builder.greaterThanOrEqualTo(
                                root.<LocalDateTime>get(searchCriteria.getKey()),
                                LocalDateTime.parse(searchCriteria.getValue().toString())
                        )
                );
            } else {
                predicate = builder.and(
                        predicate,
                        builder.greaterThanOrEqualTo(
                                root.get(searchCriteria.getKey()),
                                searchCriteria.getValue().toString()
                        )
                );
            }

        } else if (searchCriteria.getOperation().equals("<")) {
            if (root.get(searchCriteria.getKey()).getJavaType() == LocalDateTime.class) {
                predicate = builder.and(
                        predicate,
                        builder.lessThanOrEqualTo(
                                root.<LocalDateTime>get(searchCriteria.getKey()),
                                LocalDateTime.parse(searchCriteria.getValue().toString())
                        )
                );
            } else {
                predicate = builder.and(
                        predicate,
                        builder.lessThanOrEqualTo(
                                root.get(searchCriteria.getKey()),
                                searchCriteria.getValue().toString()
                        )
                );
            }
        } else { // : -> equals
            if (root.get(searchCriteria.getKey()).getJavaType() == String.class) {
                predicate = builder.and(
                        predicate,
                        builder.like(
                                root.get(searchCriteria.getKey()),
                                "%" + searchCriteria.getValue().toString() + "%"
                        )
                );
            } else {
                predicate = builder.and(
                        predicate,
                        builder.equal(
                                root.get(searchCriteria.getKey()),
                                searchCriteria.getValue().toString()
                        )
                );
            }
        }

    }
}
