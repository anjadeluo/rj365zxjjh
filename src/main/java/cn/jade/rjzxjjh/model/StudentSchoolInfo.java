package cn.jade.rjzxjjh.model;

public class StudentSchoolInfo extends BasicModel<StudentSchoolInfo> {

    public final static String CURRENTFLAG_TRUE = "1";
    public final static String CURRENTFLAG_FALSE = "0";

    private Integer id;
    private String strId;

    public String getStrId() {
        return strId;
    }

    public void setStrId(String strId) {
        this.strId = strId;
    }

    private Integer studentId;

    private String schoolName;

    private String collegeName;

    private String academicClass;

    private Integer grade;

    private String schoolClass;

    private String classTeacherName;

    private Integer classTeacherSex;

    private String classTeacherPhone;

    private String classTeacherWeixin;

    private String schoolAddress;

    private String currentFlag;

    public String getCurrentFlag() {
        return currentFlag;
    }

    public void setCurrentFlag(String currentFlag) {
        this.currentFlag = currentFlag;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName == null ? null : schoolName.trim();
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName == null ? null : collegeName.trim();
    }

    public String getAcademicClass() {
        return academicClass;
    }

    public void setAcademicClass(String academicClass) {
        this.academicClass = academicClass;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getSchoolClass() {
        return schoolClass;
    }

    public void setSchoolClass(String schoolClass) {
        this.schoolClass = schoolClass == null ? null : schoolClass.trim();
    }

    public String getClassTeacherName() {
        return classTeacherName;
    }

    public void setClassTeacherName(String classTeacherName) {
        this.classTeacherName = classTeacherName == null ? null : classTeacherName.trim();
    }

    public Integer getClassTeacherSex() {
        return classTeacherSex;
    }

    public void setClassTeacherSex(Integer classTeacherSex) {
        this.classTeacherSex = classTeacherSex;
    }

    public String getClassTeacherPhone() {
        return classTeacherPhone;
    }

    public void setClassTeacherPhone(String classTeacherPhone) {
        this.classTeacherPhone = classTeacherPhone == null ? null : classTeacherPhone.trim();
    }

    public String getClassTeacherWeixin() {
        return classTeacherWeixin;
    }

    public void setClassTeacherWeixin(String classTeacherWeixin) {
        this.classTeacherWeixin = classTeacherWeixin == null ? null : classTeacherWeixin.trim();
    }

    public String getSchoolAddress() {
        return schoolAddress;
    }

    public void setSchoolAddress(String schoolAddress) {
        this.schoolAddress = schoolAddress == null ? null : schoolAddress.trim();
    }
}