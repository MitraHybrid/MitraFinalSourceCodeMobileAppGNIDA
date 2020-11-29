library constants;



//http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/ConcernSet('100000')/?$format=json&sap-client=830

const String Base_server_URL =
    'http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/';

const String Post_service_URL= "http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/CComplaintSet";    


//http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/SubgroupSet?%24format=json&sap-client=830&%24filter=GroupID%20eq%20

const String ServiceSet = "ServiceSet";
const String Client = "?%24format=json&sap-client=830";
const String Filter = "&%24filter=MainServID%20eq%20";
const String ServiceArea = "%20and%20ServiceArea%20eq%20";
const String SubGroupId = "%20and%20SubgroupID%20eq%20";
 const String ConcernSet ="ConcernSet";
const String ActivityID = "%20and%20ActivityID%20eq%20";
const String SectorSet = "SectorSet";
const String ConcernLogset ="ConcernLogSet(Usr_Name='GNIDA-MOB',Usr_Pss='sap@mob1')?%24format=json";




const String Path =
    "MainserviceareaSet?%24format=json&sap-client=830&%24filter=MainServID%20eq%20";
const String BaseUrl = "MaingroupSet?%24format=json&sap-client=830";
const String BaseGroupUrl =
    "SubgroupSet?%24format=json&sap-client=830&%24filter=MainServID%20eq%20%27CITZ_SRV%27%20and%20ServiceArea%20eq%20";
const String BaseServiceList = "";


//http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/ConcernSet('100000')/?$format=json&sap-client=830

//http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/ConcernSet('100000')/?$format=json&sap-client=830

//http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/MaingroupSet?%24format=json&sap-client=830
//http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/ServiceSet?$format=json&sap-client=830&$filter=ServiceID eq 'SER_UBMNT'
//http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/ServiceSet?$format=json&sap-client=830&$filter=ServiceID eq %SER_SPRRR
const String SUCCESS_MESSAGE = " You will be contacted by us very soon.";
const String HOME_TITLE = "Mitra ";
const String title = "Greater Noida Industrial Development Authority";

class BOTTOMNAV {
  static String title = "Mitra";
  static String trackservichome = "Citizen Service";
  static String paynow = "Pay Now";
  static String trackservic = "Track Services";
  static String paynoe = "Pay Now";
  static String help = "Help";
  static String markattend = "Mark my Attendance";
}

class Faq {
  static String citizenService =
      "How do I submit citizen services request?\n";
  static String citizenservicedetail =
      "Based on your locality,you can choose either Urban services  Rural services and then select service type from service list table and fill the form properly ";
  static String serviceavilable =
      "Does every citizen service is available in myarea?\n";
  static String servicedetails =
      "Greater Noida Industrial Development Authority is fully committed for citizen services and cleanliness and proper maintenance of city ,Our team is dedicated and committed for maintaining the city prosperity. But some particular services may be unavailable in your area.";
  static String gpslocation = "Why do you need access of my GPS location?\n";
  static String gpsdetails =
      "We need your location to pinpoint the area from which request is coming. So that we can resolve your grievance quickly.";
  static String pollutioncomplaint =
      "How can i track my citizen service or pollution complaint?\n";
  static String pollutiondetails =
      "you will receive a message for your tracking ID. you can check the status of your complaint by entering tracking ID in track services section.";
  static String usenamePassword = "How to I get Username and Password?\n";
  static String usernamedetails =
      "If you are not registered with GNIDA, then you are requested to submit KYA form in the authority to get username and password. You can download the KYA form from the allottee login page.";
}

class LOGIN {
  static String username = "Enter UserName";
  static String password = "Enter Password";
  static String login = "Login";
  static String industrial = "Induorstrial";
  static String allotNo = "Enter Allotment No";
  static String note = "Password is case sensitive";
  static String notedes =
      "If you are not Registered with GNIDA,You are Requested to submit KYA form in the Authority to get username and password";
  static String download = "Click here to download KYA form";
}

class HOME {
  static String smogPollutionUrban = "Smog and Pollution-Urban";
  static String smogPollutionRural = "Smog and Pollution-Rural";
  static String title = "Greater Noida Industrial Development Authority";
  static String citizenUrban = "Citizen Services-Urban";
  static String citizenRural = "Citizen Services-Rural";
  static String loginMessage = "Sign In As:";
  static String allotee = "Allottee";
  static String authorityUser = "Authority User";
  static String trackServices = "Track Services";
  static String serviceComplaint = "Service Complaint";

  static String markmyattendance = "Mark My Attendance";
  static String citizenService = " Citizen Service";
  static String maintenance = "Maintenance";
  static String sanitation = "Sanitation";
  static String horticulture = "HortiCulture";
  static String serviceList = "Service List";
  static String trackapplication =
      "You can track your application by Tracking ID or Mobile Number";
  static String trackid = "Tracking ID";
  static String mobileno = "Mobile No";
  static String login = "Login";
  static String authLogin ="Authority Login";
  static String detailspage ="Detail Pages";
}

class FeedBack {
  static String feedbackreopen = "Rate this complaint";
  static String feedbacktitle = "Mitra Raiting Bar";
  static String feedback = "FeedBack";
  static String feedhint = "Review this complaint";
  static String suggImp = "Suggestions for improvement";
  static String submit = "Submit";
  static String writeyoufeedback = "Write your feedback";
  static String suggestion = "Suggestions for improvement";
}

class NavigationDrawerhint {
  static String faq = "FAQ";
  static String citizen = "Citizen Service";
  static String smogandpollution = "Smog and pollution Complaint";
  static String feedback = "Feedback and Rating";
  static String aboutUs = "About Us";
}

class Trackservice {
  static String name ="Name :";
  static String pendingat =" PendingAt :";
  static String servicerequestdate = "Service Request Date";
  static String expectedcompletda ="Expected Completion Date";
  static String servicename ="Service Name";
  static String requestname ="Request Name";
  static String siteImage= "SiteImage";
  static String documentImage ="Document Image";

  static String mobileNo = "Mobile No";
  static String trackid = "Tracking ID";
  static String tracknumber = "Tracking Number";
  static String track = "Track";
  static String feedback = "Give FeedBack";
  static String trackservice = "Track Service";
  static String alert = "Alert";
  static String cancel = "Cancel";
  static String trackalertmess = "Enter Tracking Id";
  static String trackhint =
      "You can track your application by Tracking ID or Mobile Number";
}

class ServicesHistory {
  static String note = "Note:  ";
  static String mobilenumber = " Enter Mobile Number";
  static String allotepasshit = "Password is case sensitive";
  static String allotereghit =
      "If you are not Registered with GNIDA,You are requested to submit KYA from in the Authority to get username and password ";
}


class ContantDetails{
  static String contantdetails = "Contant Details";
  static String emailId ="Email Id :";
  static String contantus ="Contant Us :";
  static String faxNo = "Fax No :";
  static String address =" Address :";
  static String info = "Info :";
}


class CitizenDetailstext {
  static String ok = "Ok";
  static String cancel = "Cancel";
  static String entername = "Enter Name ";
  static String mobilenumber = "Enter Mobile Number";
  static String emailaddress = "Enter Email Address";
  static String location = "Location";
  static String complaint = "Description of Complaint";
  static String sitephoto = "Site Photo";
  static String uploaddocument = "Upload Document";
  static String requestdate = "Request Date:";
  static String desc = " description details ";
  static String concernedperson = "Name:";
  static String concernedpersonmobno = "MobileNo:";
  static String concerndDetails = "Concerned Person Details";
  static String mobileno = " 7829710578 ";
  static String submit = "Submit";
  static String clear = "Clear";
  static String camera = "Camera";
  static String gallery = "Gallery";
  static String close = "close";
  static String conName = "Name :";
  static String designation ="Designation :";
  static String conmobile = "MobileNumber :";
  static String condate = " 7-7-2020";
}

class ProfileDetails{

}

class Allottee {
  static String allotmentNo = "Allotment No :";
  static String allotmentname = "Allotment Name :";
  static String department = "Department :";
  static String email = "Email : ";
  static String mobile = "Mobile :";
  static String mobileNumber ="MobileNumber";
  static String address = "Address :";
  static String allotmentdetails = "Allotment Details :";
  static String schemecode = "SchemeCode :";
  static String allotmentdate = "Allotment Date :";
  static String plotdetails = "PlotDetails :";
  static String plotnumber = "Plot Number :";
  static String block = "Block :";
  static String sector = "Sector :";
  static String plotsize = "Plot Size :";
}

class OtherPayment {
  static String otherpaymentdetails = "Other PaymentDetails";
  static String paytype = "Pay Type";
  static String paymentmode = "Payment Mode";
  static String transactionid = "Transaction Id";
  static String transactiondate = "Transaction date";
  static String bankref = "Bank ref";
  static String dueamount = "Due amount";
  static String interestrate = "Interest rate";
  static String totalpayable = "Total Payable";
  static String orderstatus = "Order Status";
  static String duedate = "Due Date ";
  static String outstanding = "Outstanding";
}

class PayDetails {
  static String billno = "Bill No";
  static String cgstamount = "CGST Amount(9%)";
  static String sigstamount = "SGST Amount(9%)";
  static String communationdetails = "Communication Details";
  static String proceed = "Proceed";
  static String viewpayHistory = "View Pay History";
  static String logout = "LogOut";
}

class PayHistory {
  static String payhistoryofplot = "Pay History of Plot";
  static String payhistoryofwater = "Pay History of water";
  static String payhistoryofother = "Pay History of Other";
  static String paynow = "Pay Now";
  static String pay = "Pay";
}

class Authority {
  static String pending = "Pending";
  static String disposed = "Disposed";
  static String received = "Received";
  static String trackid = "TrackId";
  static String complaintregisteredDate = "Complaint Registration Date";
}

String validateName(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
}

String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
   String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "MobileNumber is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
}

String validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
}



String validateDesc(String value){
   String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Desc is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Desc must be a-z and A-Z";
    }else if (value.length < 50){
        return "Desc must be 50 line min";
    }
    return null;
}

String validateLocation(String value){
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Location is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Desc must be a-z and A-Z";
    }else if (value.length < 50){
        return "Desc must be 50 line min";
    }
    return null;

}

class Preferences {
  static String citizenService = "CitizenAService";
  static String mainServID = "CitizenType";
  static String subgroupId = "SubgroupId";
  static String matchid = "MatchId";
  static String matchvalue ="MatchValue";
}


//http://115.124.110.39:1080/sap/opu/odata/sap/ZGW_SERVICES_SRV/ConcernLogSet(Usr_Name='GNIDA-MOB',Usr_Pss='welcome')?$format=json