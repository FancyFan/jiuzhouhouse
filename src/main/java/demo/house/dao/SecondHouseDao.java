package demo.house.dao;

import demo.house.model.House;
import demo.house.model.SecondHouse;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by banma82 on 2017/8/11.
 */
@Component
public interface SecondHouseDao {

    List<SecondHouse> getAllHouse();

    List<SecondHouse> getHousesByToken(int houseToken);

    int updateHouseById(SecondHouse house);

    int addHouse(SecondHouse house);

    int deleteHouseById(int houseId);

    SecondHouse findHouseById(int id);

    void saveImgSrc(int houseId, String imgSrc);

    void updateHouseToken(int houseId);

    List<SecondHouse> getHouseByUserId(int userId);

    List<SecondHouse> getHouseListByCommunityName(String communityName);

    List<SecondHouse> getIndexHouse();

    List<SecondHouse> searchForHouse(@Param("province") String province, @Param("city") String city, @Param("county") String county, @Param("address") String address, @Param("houseType") String houseType, @Param("minArea") Integer minArea, @Param("maxArea") Integer maxArea, @Param("minPrice") Integer minPrice, @Param("maxPrice") Integer maxPrice);

}
