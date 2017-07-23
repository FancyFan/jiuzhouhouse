package demo.house.dao;

import demo.house.model.House;
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

}
