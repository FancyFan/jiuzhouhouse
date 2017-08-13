package demo.house.dao;

import demo.house.model.House;
import demo.house.model.RentHouse;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by banma82 on 2017/8/11.
 */
@Component
public interface RentHouseDao {
    List<RentHouse> getAllHouse();

    List<RentHouse> getHousesByToken(int houseToken);

    int updateHouseById(RentHouse house);

    int addHouse(RentHouse house);

    int deleteHouseById(int houseId);

    RentHouse findHouseById(int id);

    void saveImgSrc(int houseId, String imgSrc);

    void updateHouseToken(int houseId);

    List<RentHouse> getHouseByUserId(int userId);

    List<RentHouse> getHouseListByCommunityName(String communityName);

    List<RentHouse> getIndexHouse();

    List<RentHouse> searchForHouse(@Param("province") String province, @Param("city") String city, @Param("county") String county, @Param("address") String address, @Param("houseType") String houseType, @Param("minArea") Integer minArea, @Param("maxArea") Integer maxArea, @Param("minPrice") Integer minPrice, @Param("maxPrice") Integer maxPrice);

}
