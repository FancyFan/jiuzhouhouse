package demo.house.model;

/**
 * Created by banma82 on 2017/8/11.
 */
public class SecondHouse {
    int houseId;
    int saleType;  //1为出租，2为售卖
    String houseType; //户型，如两室一厅
    float area;  //面积
    float price;
    String communityName; //小区名字，如金领国际
    String address;
    String authorTel; //电话
    String authorName;
    String des;  //详情描述

    String imgSrc = "house/000.jpg";
    int houseToken;
    int useId;
    String city;
    String province;
    String county;

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public int getHouseId() {
        return houseId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public int getSaleType() {
        return saleType;
    }

    public void setSaleType(int saleType) {
        this.saleType = saleType;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public String getCommunityName() {
        return communityName;
    }

    public void setCommunityName(String communityName) {
        this.communityName = communityName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAuthorTel() {
        return authorTel;
    }

    public void setAuthorTel(String authorTel) {
        this.authorTel = authorTel;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getHouseToken() {
        return houseToken;
    }

    public void setHouseToken(int houseToken) {
        this.houseToken = houseToken;
    }

    public int getUseId() {
        return useId;
    }

    public void setUseId(int useId) {
        this.useId = useId;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }
}
