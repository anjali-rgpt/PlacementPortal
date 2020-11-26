function validate(event){

    const stringRegex=/^[A-Z][a-z]+$/
    const phoneNumRegex=/^[789](\d{9})$/
    const rollNumRegex=/^CB\.EN\.(U4|P2)(CSE|ECE|MEE|EEE|CIV|CHE)[1][78][0123456][0123456][\d{1}]$/
    const emailRegex=/^[a-z][a-z\d]+@(gmail|hotmail|yahoo)\.com$/
    
    var flag=0;

    try{
    var fname=document.getElementById('fname').value;
    var mname=document.getElementById('mname').value;
    var lname=document.getElementById('lname').value;

    if (mname.length==0){

        var isValid=stringRegex.test(fname) && stringRegex.test(lname);
    }

    else{

        var isValid=stringRegex.test(fname) && stringRegex.test(lname) && stringRegex.test(mname);
    }

    if (!isValid){
        alert('Name is not valid string expression.');
        console.log(fname, mname, lname);
        return false;

    }

    var rollNum=document.getElementById('rollnumber').value;
    if(!rollNumRegex.test(rollNum)){
        console.log(rollNum);
        alert('Invalid Roll Number format entered');
        return false;
    }

    var emailiD=document.getElementById('email').value;
    if(!emailRegex.test(emailiD)){
        console.log(emailiD);
        alert('Invalid email format');
        return false;
    }

    var phone=document.getElementById('phonenum').value;
    if(!phoneNumRegex.test(phone)){
        console.log(phone);
        alert('Invalid phone number');
        return false;
    }

    var cgpa=document.getElementById('cgpa').value;
    var temp=parseFloat(cgpa).toFixed(2);
    if (temp.includes('e')){
        console.log(temp);
        alert('Invalid number entered');
        return false;
    }

    else if(parseFloat(temp)>10.0 || parseFloat(temp)<0.0){
        console.log(temp)
        alert('Bad range');
        return false;
    }

    company=document.getElementById('companybox').value;
    if(company.length==0){
        alert('No company selected');
        return false;
    }

    resume=document.getElementById('r-upload').value;
    extension=resume.split('.').reverse()[0];
    if(extension!='pdf'){
        alert('Invalid resume format');
        return false;
    }



  return true;
    }

    catch(err){
        console.log(err);
        return false;
    }
}