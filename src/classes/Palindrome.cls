public class Palindrome {
    public static Boolean Check(String someS){
        if(someS == someS.reverse()) return True;
        else return False;
    }
    public static Boolean Check(Integer someI){
        //return Palindrome.Check(someI.format());
        Integer reversedI = 0;
        Integer normalI = someI;
        while(someI >= 1){
            reversedI = (reversedI * 10) + math.mod(someI, 10);
            someI = someI / 10;
        }
        if(normalI == reversedI) return True;
        else return False;
    }
}