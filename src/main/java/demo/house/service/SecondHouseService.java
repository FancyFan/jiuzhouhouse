package demo.house.service;

import demo.house.dao.SecondHouseDao;
import demo.house.exception.HouseException;
import demo.house.model.SecondHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by banma82 on 2017/8/11.
 */
@Service
public class SecondHouseService {
    @Autowired
    private SecondHouseDao houseDao;

    public List<SecondHouse> getAllHouse() {
        System.out.print("admin service call house dao");
        List<SecondHouse> list = houseDao.getAllHouse();
        System.out.print("admin service get all house");
        return list;
    }

    public SecondHouse getHouseById(int id) {
        System.out.println("begin get house");
        SecondHouse house = houseDao.findHouseById(id);
        System.out.println("already get house");
        return house;
    }

    public List<SecondHouse> getHousesByToken(int houseToken) {
        List<SecondHouse> list = houseDao.getHousesByToken(houseToken);
        return list;
    }

    public List<SecondHouse> getHouseByUserId(int userId) {
        List<SecondHouse> list = houseDao.getHouseByUserId(userId);
        return list;
    }

    public List<SecondHouse> getHouseListByCommunityName(String communityName) {
        List<SecondHouse> list = houseDao.getHouseListByCommunityName(communityName);
        return list;
    }

    public List<SecondHouse> getIndexHouse() {
        return houseDao.getIndexHouse();
    }

    public List<SecondHouse> searchForHouse(String province, String city, String county, String address, String houseType, Integer minArea, Integer maxArea, Integer minPrice, Integer maxPrice) {
        return houseDao.searchForHouse(province, city, county, address, houseType, minArea, maxArea, minPrice, maxPrice);
    }

    @Transactional
    public int updateHouse(SecondHouse house) throws HouseException {

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
    public int addHouse(SecondHouse house) throws HouseException {
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
