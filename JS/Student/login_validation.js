function Symbolcheck(str){
    const val_regex = /[!|#|$|%|^|&|*|(|)|+|-|*|/|+|{|}|;|:|'|"|<|>|,|~|`|\s]/;

    return (!val_regex.test(str));
}

function Splitcheck(str){
    var split1 = str.split("@");
    var split2 = str.split(".");
    return (split1.length == 2 && split2.length == 2 && !(/[.]/.test(split1[0])) && !(/[@]/.test(split2[1])));
}

function Endcheck(str){
    const val_regex = /[0-9_@.]+/

    var split1 = str.split("@");
    var split2 = split1[1].split(".");
    return (!val_regex.test(split2[1]) && !val_regex.test(split2[0]));
}

function LoginValidation(){
    var em = document.getElementById("email").value;
    var pas = document.getElementById("pass").value;

    if(Symbolcheck(em) && Splitcheck(em) && Endcheck(em)){

        if((String(pas)).length >= 8){
            window.location.href = "https://anjali-rgpt.github.io/PlacementPortal/HTML/Student/mainpage.html#";
        }

        else{
            alert("You have entered an invalid password!");
        }
    }

    else{
        alert("You have entered an invalid email address!");
    }
};
