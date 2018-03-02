package entity;

public class RollCall {
    private Integer id;

    private String sname;

    private String sid;

    private String remarks;

    private Integer type;

    private String rctime;

    @Override
    public String toString() {
        return "RollCall{" +
                "id=" + id +
                ", sname='" + sname + '\'' +
                ", sid='" + sid + '\'' +
                ", remarks='" + remarks + '\'' +
                ", type=" + type +
                ", rctime='" + rctime + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getRctime() {
        return rctime;
    }

    public void setRctime(String rctime) {
        this.rctime = rctime == null ? null : rctime.trim();
    }
}