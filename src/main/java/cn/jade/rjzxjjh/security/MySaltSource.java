package cn.jade.rjzxjjh.security;

import cn.jade.rjzxjjh.utils.SecurityUtils;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * Created by yhsk on 2018/5/22.
 */
public class MySaltSource implements SaltSource {
    @Override
    public String getSalt(UserDetails userDetails) {
        return SecurityUtils.getMD5(userDetails.getUsername());
    }
}
