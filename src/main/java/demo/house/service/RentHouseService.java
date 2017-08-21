package demo.house.service;

import demo.house.dao.RentHouseDao;
import demo.house.exception.HouseException;
import demo.house.model.House;
import demo.house.model.RentHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by banma82 on 2017/8/11.
 */
@Service
public class RentHouseService {
    @Autowired
    private RentHouseDao houseDao;

    public List<RentHouse> getAllHouse() {
        System.out.print("admin service call house dao");
        List<RentHouse> list = houseDao.getAllHouse();
        System.out.print("admin service get all house");
        return list;
    }

    public RentHouse getHouseById(int id) {
        System.out.println("begin get house");
        RentHouse house = houseDao.findHouseById(id);
        System.out.println("already get house");
        return house;
    }

    public List<RentHouse> getHousesByToken(int houseToken) {
        List<RentHouse> list = houseDao.getHousesByToken(houseToken);
        return list;
    }

    public List<RentHouse> getHouseByUserId(int userId) {
        List<RentHouse> list = houseDao.getHouseByUserId(userId);
        return list;
    }

    public List<RentHouse> getHouseListByCommunityName(String communityName) {
        List<RentHouse> list = houseDao.getHouseListByCommunityName(communityName);
        return list;
    }

    public List<RentHouse> getIndexHouse() {
        return houseDao.getIndexHouse();
    }

    public List<RentHouse> searchForHouse(String province, String city, String county, String address, String houseType, Integer minArea, Integer maxArea, Integer minPrice, Integer maxPrice) {
        return houseDao.searchForHouse(province, city, county, address, houseType, minArea, maxArea, minPrice, maxPrice);
    }

    @Transactional
    public int updateHouse(RentHouse house) throws HouseException {

        System.out.println(house.getImgSrc());
        int updateHouseCount = houseDao.updateHouseById(house);

        if (updateHouseCount < 1)
            throw new HouseException(String.format("更新%s对应的house信息失败", house.getHouseId()));

        return updateHouseCount;
    }

    @Transactional
    public void updateHouseToken(int houseId) {
        houseDao.updateHouseToken(houseId);
    }

    @Transactional
    public int addHouse(RentHouse house) throws HouseException {
        int addHouseCount = 0;
        try {
            addHouseCount = houseDao.addHouse(house);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (addHouseCount < 1) {
            System.out.println(addHouseCount);
        }
        return addHouseCount;
    }

    @Transactional
    public int deleteHouseById(int houseId) throws HouseException {
        int deleteHouseCount = houseDao.deleteHouseById(houseId);
        if (deleteHouseCount < 0) {
            throw new HouseException(String.format("删除%d对应的house信息失败", houseId));
        }
        return deleteHouseCount;
    }

    public void saveImgSrc(Integer houseId, String houseImgSrc) {
        houseDao.saveImgSrc(houseId, houseImgSrc);
    }
}
