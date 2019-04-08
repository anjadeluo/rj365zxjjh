package cn.jade.rjzxjjh.model;

import cn.jade.rjzxjjh.utils.StringUtils;

import java.util.Date;
import java.util.List;

public class Student extends BasicModel<Student> {

    private Integer id;
    private String name;
    private Integer sex;
    private Integer age;
    private String idCardNumber;
    private Date idCardStartDate;
    private Date idCardEndDate;
    private Integer nation;
    private Integer announceType;
    private String nativePlace;
    private String announceAddress;
    private String phoneNumber;
    private String weixinNumber;
    private String qqNumber;
    private String email;
    private String mailNumber;
    private String relatAddress;
    private String homeAddress;

    private String strId;

    public String getStrId() {
        return strId;
    }

    public void setStrId(String strId) {
        this.strId = strId;
    }

    private StudentBankInfo studentBankInfo;
    private List<StudentGuardian> studentGuardianList;
    private List<StudentSchoolInfo> studentSchoolInfoList;
    private StudentSchoolInfo currentSchool;

    public StudentSchoolInfo getCurrentSchool() {
        return currentSchool;
    }

    public void setCurrentSchool(StudentSchoolInfo currentSchool) {
        this.currentSchool = currentSchool;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getIdCardNumber() {
        return idCardNumber;
    }

    public void setIdCardNumber(String idCardNumber) {
        this.idCardNumber = idCardNumber == null ? null : idCardNumber.trim();
    }

    public Date getIdCardStartDate() {
        return idCardStartDate;
    }

    public void setIdCardStartDate(Date idCardStartDate) {
        this.idCardStartDate = idCardStartDate;
    }

    public Date getIdCardEndDate() {
        return idCardEndDate;
    }

    public void setIdCardEndDate(Date idCardEndDate) {
        this.idCardEndDate = idCardEndDate;
    }

    public Integer getNation() {
        return nation;
    }

    public void setNation(Integer nation) {
        this.nation = nation;
    }

    public Integer getAnnounceType() {
        return announceType;
    }

    public void setAnnounceType(Integer announceType) {
        this.announceType = announceType;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace == null ? null : nativePlace.trim();
    }

    public String getAnnounceAddress() {
        return announceAddress;
    }

    public void setAnnounceAddress(String announceAddress) {
        this.announceAddress = announceAddress == null ? null : announceAddress.trim();
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber == null ? null : phoneNumber.trim();
    }

    public String getWeixinNumber() {
        return weixinNumber;
    }

    public void setWeixinNumber(String weixinNumber) {
        this.weixinNumber = weixinNumber == null ? null : weixinNumber.trim();
    }

    public String getQqNumber() {
        return qqNumber;
    }

    public void setQqNumber(String qqNumber) {
        this.qqNumber = qqNumber == null ? null : qqNumber.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getMailNumber() {
        return mailNumber;
    }

    public void setMailNumber(String mailNumber) {
        this.mailNumber = mailNumber == null ? null : mailNumber.trim();
    }

    public String getRelatAddress() {
        return relatAddress;
    }

    public void setRelatAddress(String relatAddress) {
        this.relatAddress = relatAddress == null ? null : relatAddress.trim();
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress == null ? null : homeAddress.trim();
    }

    public StudentBankInfo getStudentBankInfo() {
        return studentBankInfo;
    }

    public void setStudentBankInfo(StudentBankInfo studentBankInfo) {
        this.studentBankInfo = studentBankInfo;
    }

    public List<StudentGuardian> getStudentGuardianList() {
        return studentGuardianList;
    }

    public void setStudentGuardianList(List<StudentGuardian> studentGuardianList) {
        this.studentGuardianList = studentGuardianList;
    }

    public List<StudentSchoolInfo> getStudentSchoolInfoList() {
        return studentSchoolInfoList;
    }

    public void setStudentSchoolInfoList(List<StudentSchoolInfo> studentSchoolInfoList) {
        this.studentSchoolInfoList = studentSchoolInfoList;
    }
}