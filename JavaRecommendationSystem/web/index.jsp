<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Recommendation System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="static/css/bootstrap.css/bootstrap.min.css">
    <script src="webapp/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="css/foundation.css" />
    <script src="js/vendor/modernizr.js"></script>
    <style><%@include file="css/style.css"%></style>

    <script language="javascript" type="text/javascript">

        function OnDropDownChange() {
            var e = document.getElementById("selectQuestion");
            var selOption = e.options[e.selectedIndex].value;
            var descText = "Something went wrong!"
            if(selOption == "0"){
                descText = "One way to implement deep copy is to add copy constructors to each associated class. A copy constructor takes an instance of 'this' as its single argument and copies all the values from it. Quite some work, but pretty straightforward and safe. EDIT: note that you don't need to use accessor methods to read fields. You can access all fields directly because the source instance is always of the same type as the instance with the copy constructor. Obvious but might be overlooked. Example: Edit: Note that when using copy constructors you need to know the runtime type of the object you are copying. With the above approach you cannot easily copy a mixed list (you might be able to do it with some reflection code).";
            }else if(selOption == "1"){
                descText = "I was presented with this question in an end of module open book exam today and found myself lost. i was reading Head first Javaand both definitions seemed to be exactly the same. i was just wondering what the MAIN difference was for my own piece of mind. i know there are a number of similar questions to this but, none i have seen which provide a definitive answer.Thanks, Darren";
            }
            else if(selOption == "2"){
                descText = "Inheritance is when a 'class' derives from an existing 'class'.So if you have a Person class, then you have a Student class that extends Person, Student inherits all the things that Person has.There are some details around the access modifiers you put on the fields/methods in Person, but that's the basic idea.For example, if you have a private field on Person, Student won't see it because its private, and private fields are not visible to subclasses.Polymorphism deals with how the program decides which methods it should use, depending on what type of thing it has.If you have a Person, which has a read method, and you have a Student which extends Person, which has its own implementation of read, which method gets called is determined for you by the runtime, depending if you have a Person or a Student.It gets a bit tricky, but if you do something likePerson p = new Student();p.read();the read method on Student gets called.Thats the polymorphism in action.You can do that assignment because a Student is a Person, but the runtime is smart enough to know that the actual type of p is Student.Note that details differ among languages.You can do inheritance in javascript for example, but its completely different than the way it works in Java.";
            }
            else if(selOption == "3"){
                descText = "Polymorphism: The ability to treat objects of different types in a similar manner.Example: Giraffe and Crocodile are both Animals, and animals can Move.If you have an instance of an Animal then you can call Move without knowing or caring what type of animal it is.Inheritance: This is one way of achieving both Polymorphism and code reuse at the same time.Other forms of polymorphism:There are other way of achieving polymorphism, such as interfaces, which provide only polymorphism but no code reuse (sometimes the code is quite different, such as Move for a Snake would be quite different from Move for a Dog, in which case an Interface would be the better polymorphic choice in this case.In other dynamic languages polymorphism can be achieved with Duck Typing, which is the classes don't even need to share the same base class or interface, they just need a method with the same name.Or even more dynamic like Javascript, you don't even need classes at all, just an object with the same method name can be used polymorphically.";
            }
            else if(selOption == "4"){
                descText = "I found out that the above piece of code is perfectly legal in Java. I have the following questions. ThanksAdded one more question regarding Abstract method classes.";
            }
            else if(selOption == "5"){
                descText = "In java it's a bit difficult to implement a deep object copy function. What steps you take to ensure the original object and the cloned one share no reference? ";
            }
            else if(selOption == "6"){
                descText = "You can make a deep copy serialization without creating some files. Copy: Restore:";
            }
            else if(selOption == "7"){
                descText = "Java has the ability to create classes at runtime. These classes are known as Synthetic Classes or Dynamic Proxies. See for more information. Other open-source libraries, such as and also allow you to generate synthetic classes, and are more powerful than the libraries provided with the JRE. Synthetic classes are used by AOP (Aspect Oriented Programming) libraries such as Spring AOP and AspectJ, as well as ORM libraries such as Hibernate. ";
            }
            else if(selOption == "8"){
                descText = "In short: the web server issues a unique identifier to on his visit. The visitor must bring back that ID for him to be recognised next time around. This identifier also allows the server to properly segregate objects owned by one session against that of another. If is: If is: Once he's on the service mode and on the groove, the servlet will work on the requests from all other clients.Why isn't it a good idea to have one instance per client? Think about this: Will you hire one pizza guy for every order that came? Do that and you'd be out of business in no time. It comes with a small risk though. Remember: this single guy holds all the order information in his pocket: so if you're not cautious about, he may end up giving the wrong order to a certain client.";
            }
            else if(selOption == "9"){
                descText = "A safe way is to serialize the object, then deserialize.This ensures everything is a brand new reference.about how to do this efficiently. Caveats: It's possible for classes to override serialization such that new instances are created, e.g. for singletons.Also this of course doesn't work if your classes aren't Serializable.";
            }
            document.getElementById("description").innerHTML = "selected: " + descText;
            $.get('/RecommenderServlet?id='+selOption, function(request, response) {

                for(var x = 0; x < request.length; x++) {
                    var elementID = Object.keys(request[x])[0];
                    var recommendation = request[x][elementID];
                    var element = document.getElementById(elementID);
                    element.innerHTML = '<p><b class="#panel2a">Recommendation '+ (x+1).toString()+'</b></br><a href="'+recommendation + '" target="_blank">' + recommendation + '</a></p>';

                }

            });
        }
    </script>
</head>
<body>
<div class="navbar so-header">
    <p><img src="img/so-logo.png" style="float:left" class="so-header-logo"><h2 style="position: relative"> Java Books Recommendation System</h2></p>
</div>


<style></style>
<div class="container-fluid">
    <div style="float:left;padding:1px;width:48%;height:1080px;text-align:justify;overflow:scroll;border:1px solid black;">
        <div class="col-md-2 d-none d-md-block sidebar">
            <div class="sidebar-selected" style="text-align: center;">
                Questions
            </div>
        </div>
        <div class="col-md-8">
            <div>
                <form action="ServletPath" >
                    <div class="row q-summery">
                        <div>
                            <select id="selectQuestion" name="selectQuestion" onchange="OnDropDownChange();">
                                <option selected="" value=""></option>
                                <option value="0">Question 1</option>
                                <option value="1">Question 2</option>
                                <option value="2">Question 3</option>
                                <option value="3">Question 4</option>
                                <option value="4">Question 5</option>
                                <option value="5">Question 6</option>
                                <option value="6">Question 7</option>
                                <option value="7">Question 8</option>
                                <option value="8">Question 9</option>
                                <option value="9">Question 10</option>
                            </select>
                        </div>
                    </div>
                    <div class = "row q-summery">
                        <p id="description" type="text"></p>
                    </div>
                </form>
                <div style="align:center;text-align:center;background-color:#f0f8ff">
                    <p id="out"></p>
                </div>
            </div>
        </div>
    </div>


    <div style="float:right;padding:1px;width:48%;height:1080px;text-align:left;overflow:scroll;border:1px solid black;">
        <div class="col-md-2 d-none d-md-block sidebar">
            <div class="sidebar-selected" style="text-align: center;" >
                Recommendations
            </div>
        </div>
        <div class="row">
            <div>
                <ul class="accordion" data-accordion>
                   <div id = "message0" ></div>
                    <div id = "message1"></div>
                    <div id = "message2"></div>
                    <div id = "message3"></div>
                    <div id = "message4"></div>
                    <div id = "message5"></div>
                    <div id = "message6"></div>
                    <div id = "message7"></div>
                    <div id = "message8"></div>
                    <div id = "message9"></div>
                </ul>
            </div>
        </div>
    </div>

</div>


<script src="js/vendor/jquery.js"></script>
<script src="js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>
