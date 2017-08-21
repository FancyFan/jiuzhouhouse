package demo.house.dao;

import demo.house.model.House;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by z674143 on 2017/6/15.
 */
@Component
public interface HouseDao {
    List<House> getAllHouse();

    List<House> getHousesByToken(int houseToken);

    int updateHouseById(House house);

    int addHouse(House house);

    int deleteHouseById(int houseId);

    House findHouseById(int id);

    void saveImgSrc(int houseId, String imgSrc);

    void updateHouseToken(int houseId);

    List<House> getHouseByUserId(int userId);

    List<House> getHouseListByCommunityName(String communityName);

    List<House> getIndexHouse();

    List<House> searchForHouse(@Param("province") String province, @Param("city") String city, @Param("county") String county, @Param("address") String address, @Param("houseType") String houseType, @Param("minArea") Integer minArea, @Param("maxArea") Integer maxArea, @Param("minPrice") Integer minPrice, @Param("maxPrice") Integer maxPrice);

    List<House> getHousesForList(@Param("start") int start,@Param("end") int end);
}
