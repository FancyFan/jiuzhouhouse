package demo.house.service;

import demo.house.dao.HouseDao;
import demo.house.exception.HouseException;
import demo.house.model.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Z674143 on 2017/4/12.
 */
@Service
public class AdminService {

    @Autowired
    private HouseDao houseDao;

    public List<House> getAllHouse() {
        System.out.print("admin service call house dao");
        List<House> list = houseDao.getAllHouse();
        System.out.print("admin service get all house");
        return list;
    }

    public House getHouseById(int id) {
        System.out.println("begin get house");
        House house = houseDao.findHouseById(id);
        System.out.println("already get house");
        return house;
    }

    public List<House> getHousesByToken(int houseToken) {
        List<House> list = houseDao.getHousesByToken(houseToken);
        return list;
    }

    public List<House> getHouseByUserId(int userId) {
        List<House> list = houseDao.getHouseByUserId(userId);
        return list;
    }

    public List<House> getHouseListByCommunityName(String communityName) {
        List<House> list = houseDao.getHouseListByCommunityName(communityName);
        return list;
    }

    public List<House> getIndexHouse() {
        return houseDao.getIndexHouse();
    }

    public List<House> searchForHouse(String province, String city, String county, String address, String houseType, Integer minArea, Integer maxArea, Integer minPrice, Integer maxPrice) {
        return houseDao.searchForHouse(province, city, county, address, houseType, minArea, maxArea, minPrice, maxPrice);
    }

    @Transactional
    public int updateHouse(House house) throws HouseException {

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
    public int addHouse(House house) throws HouseException {
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

    public List<House> getHousesForList(int start, int end) {
        return houseDao.getHousesForList(start, end);
    }
}
