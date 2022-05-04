package net.lele.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import net.lele.dao.User;

import java.util.List;

@Mapper
public interface UserMapper {

    /**
     * If using simple sql, we can use annotation. Such as @Select @Update.
     * If using ${username}, application will send a error.
     */
    @Select("select * from user where nickname = #{nickname}")
    User findByUserName(@Param("nickname") String nickname);

    @Select("select * from user where nickname = '${nickname}'")
    List<User> findByUserNameVuln01(@Param("nickname") String nickname);

    List<User> findByUserNameVuln02(String nickname);
    List<User> findByUserNameVuln03(@Param("order") String order);

    User findById(Integer id);

    User OrderByUsername();

}