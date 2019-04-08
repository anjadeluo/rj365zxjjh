package cn.jade.rjzxjjh.model;

import java.util.Date;

public class AidedInfo extends BasicModel<AidedInfo> {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.id
     *
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.aided_person_name
     *
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    private String aidedPersonName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.student_id
     *
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    private Integer studentId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.school_id
     *
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    private Integer schoolId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.sex
     *
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    private Integer sex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.phone
     *
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    private String phone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.weixin
     *
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    private String weixin;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.money
     *
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    private Double money;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.aided_date
     *
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    private Date aidedDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.brokerage
     *
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    private String brokerage;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.school_info
     *
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    private String schoolInfo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aided_info.address
     *
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    private String address;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.id
     *
     * @return the value of aided_info.id
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.id
     *
     * @param id the value for aided_info.id
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.aided_person_name
     *
     * @return the value of aided_info.aided_person_name
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public String getAidedPersonName() {
        return aidedPersonName == null ? "" : aidedPersonName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.aided_person_name
     *
     * @param aidedPersonName the value for aided_info.aided_person_name
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public void setAidedPersonName(String aidedPersonName) {
        this.aidedPersonName = aidedPersonName == null ? "" : aidedPersonName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.student_id
     *
     * @return the value of aided_info.student_id
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public Integer getStudentId() {
        return studentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.student_id
     *
     * @param studentId the value for aided_info.student_id
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.school_id
     *
     * @return the value of aided_info.school_id
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public Integer getSchoolId() {
        return schoolId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.school_id
     *
     * @param schoolId the value for aided_info.school_id
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.sex
     *
     * @return the value of aided_info.sex
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public Integer getSex() {
        return sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.sex
     *
     * @param sex the value for aided_info.sex
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.phone
     *
     * @return the value of aided_info.phone
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public String getPhone() {
        return phone == null ? "" : phone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.phone
     *
     * @param phone the value for aided_info.phone
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public void setPhone(String phone) {
        this.phone = phone == null ? "" : phone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.weixin
     *
     * @return the value of aided_info.weixin
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public String getWeixin() {
        return weixin == null ? "" : weixin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.weixin
     *
     * @param weixin the value for aided_info.weixin
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public void setWeixin(String weixin) {
        this.weixin = weixin == null ? "" : weixin.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.money
     *
     * @return the value of aided_info.money
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public Double getMoney() {
        return money;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.money
     *
     * @param money the value for aided_info.money
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public void setMoney(Double money) {
        this.money = money;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.aided_date
     *
     * @return the value of aided_info.aided_date
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public Date getAidedDate() {
        return aidedDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.aided_date
     *
     * @param aidedDate the value for aided_info.aided_date
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public void setAidedDate(Date aidedDate) {
        this.aidedDate = aidedDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.brokerage
     *
     * @return the value of aided_info.brokerage
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public String getBrokerage() {
        return brokerage == null ? "" : brokerage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.brokerage
     *
     * @param brokerage the value for aided_info.brokerage
     * @mbggenerated Fri Mar 29 14:48:40 CST 2019
     */
    public void setBrokerage(String brokerage) {
        this.brokerage = brokerage == null ? "" : brokerage.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.school_info
     *
     * @return the value of aided_info.school_info
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public String getSchoolInfo() {
        return schoolInfo == null ? "" : schoolInfo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.school_info
     *
     * @param schoolInfo the value for aided_info.school_info
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public void setSchoolInfo(String schoolInfo) {
        this.schoolInfo = schoolInfo == null ? "" : schoolInfo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aided_info.address
     *
     * @return the value of aided_info.address
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public String getAddress() {
        return address == null ? "" : address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aided_info.address
     *
     * @param address the value for aided_info.address
     * @mbggenerated Fri Mar 29 18:52:51 CST 2019
     */
    public void setAddress(String address) {
        this.address = address == null ? "" : address.trim();
    }

}