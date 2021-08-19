package com.shop.mint.general.auth.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Role {

    private Long id;

    private RoleName name;

    public Role(RoleName name) {
        this.name = name;
    }

}
